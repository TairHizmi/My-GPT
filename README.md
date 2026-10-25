# ChatGPT Clone

Full Stack project: React (SPA) + FastAPI (REST API) + MySQL + OpenAI API.

GitHub: https://github.com/TairHizmi/My-GPT

## Setup
1. Database: run `Database/schema.sql` in MySQL (creates DB `chatgpt_clone`).
2. Backend:
   ```
   cd Backend
   python -m venv venv && venv\Scripts\activate   # (Linux/Mac: source venv/bin/activate)
   pip install -r requirements.txt
   copy .env.example .env     # fill in OPENAI_API_KEY and DATABASE_URL
   uvicorn main:app --reload
   ```
3. Frontend:
   ```
   cd Frontend
   npm install
   npm run dev
   ```
Open http://localhost:5173

## Design
- `conversations(id UUID, created_at)` - one row per chat.
- `messages(id, conversation_id FK, role ENUM('user','assistant'), content, created_at)`.
- Each request loads the full history of the conversation from the DB and sends it to OpenAI, so the chat keeps context.
- The API key lives only in `Backend/.env` (git-ignored).
