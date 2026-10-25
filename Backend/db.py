import os
from datetime import datetime
from dotenv import load_dotenv
from sqlalchemy import create_engine, ForeignKey, String, Text, Enum, DateTime, func
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, sessionmaker

load_dotenv()
engine = create_engine(
    os.getenv("DATABASE_URL", "mysql+pymysql://root:password@localhost:3306/chatgpt_clone"),
    pool_pre_ping=True,
)
SessionLocal = sessionmaker(engine)


class Base(DeclarativeBase):
    pass


class Conversation(Base):
    __tablename__ = "conversations"
    id: Mapped[str] = mapped_column(String(36), primary_key=True)
    created_at: Mapped[datetime] = mapped_column(DateTime, server_default=func.now())


class Message(Base):
    __tablename__ = "messages"
    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    conversation_id: Mapped[str] = mapped_column(ForeignKey("conversations.id"), index=True)
    role: Mapped[str] = mapped_column(Enum("user", "assistant", name="role"))
    content: Mapped[str] = mapped_column(Text)
    created_at: Mapped[datetime] = mapped_column(DateTime, server_default=func.now())
