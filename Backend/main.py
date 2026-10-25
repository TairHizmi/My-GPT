import os
import uuid
from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from openai import OpenAI
from pydantic import BaseModel
from sqlalchemy import select
from db import Base, engine, SessionLocal, Conversation, Message

load_dotenv()
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))  # key stays server-side
MODEL = os.getenv("OPENAI_MODEL", "gpt-4o-mini")

Base.metadata.create_all(engine)  # convenience; schema.sql does the same
app = FastAPI(title="ChatGPT Clone API")
app.add_middleware(
    CORSMiddleware,
    allow_origins=[os.getenv("FRONTEND_ORIGIN", "http://localhost:5173")],
    allow_methods=["*"],
    allow_headers=["*"],
)


class ChatIn(BaseModel):
    message: str
    conversation_id: str | None = None


@app.post("/api/chat")
def chat(body: ChatIn):
    text = body.message.strip()
    if not text:
        raise HTTPException(400, "Message is empty")
    with SessionLocal() as db:
        if body.conversation_id:
            conv = db.get(Conversation, body.conversation_id)
            if not conv:
                raise HTTPException(404, "Conversation not found")
        else:
            conv = Conversation(id=str(uuid.uuid4()))
            db.add(conv)
            db.flush()
        db.add(Message(conversation_id=conv.id, role="user", content=text))
        db.flush()
        history = db.scalars(
            select(Message).where(Message.conversation_id == conv.id).order_by(Message.id)
        ).all()
        try:
            res = client.chat.completions.create(
                model=MODEL,
                messages=[{"role": m.role, "content": m.content} for m in history],
            )
        except Exception as e:
            db.rollback()
            raise HTTPException(502, f"OpenAI error: {e}")
        reply = res.choices[0].message.content or ""
        db.add(Message(conversation_id=conv.id, role="assistant", content=reply))
        db.commit()
        return {"conversation_id": conv.id, "reply": reply}
