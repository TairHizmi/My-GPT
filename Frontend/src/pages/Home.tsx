import { useEffect, useRef, useState, type FormEvent } from "react";

interface Message {
  role: "user" | "assistant";
  content: string;
}

interface ChatResponse {
  conversation_id: string;
  reply: string;
}

const API = import.meta.env.VITE_API_URL || "http://localhost:8000";

export default function Home() {
  const [messages, setMessages] = useState<Message[]>([]);
  const [conversationId, setConversationId] = useState<string | null>(null);
  const [text, setText] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const endRef = useRef<HTMLDivElement>(null);

  useEffect(() => { endRef.current?.scrollIntoView({ behavior: "smooth" }); }, [messages, loading]);

  async function send(e: FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const content = text.trim();
    if (!content || loading) return;
    setText(""); setError(""); setLoading(true);
    setMessages((m) => [...m, { role: "user", content }]);
    try {
      const res = await fetch(`${API}/api/chat`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message: content, conversation_id: conversationId }),
      });
      if (!res.ok) throw new Error((await res.json()).detail || "Request failed");
      const data: ChatResponse = await res.json();
      setConversationId(data.conversation_id);
      setMessages((m) => [...m, { role: "assistant", content: data.reply }]);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Something went wrong");
    } finally {
      setLoading(false);
    }
  }

  function newChat() { setMessages([]); setConversationId(null); setError(""); setText(""); }

  const empty = messages.length === 0;
  return (
    <main className="chat">
      <button className="new-chat" onClick={newChat}>✎ New chat</button>
      {empty && <h1 className="hero">What's on the agenda today?</h1>}
      <div className="messages">
        {messages.map((m, i) => (
          <div key={i} className={`msg ${m.role}`}><span>{m.content}</span></div>
        ))}
        {loading && <div className="msg assistant"><span className="dots">Thinking…</span></div>}
        {error && <div className="error">{error}</div>}
        <div ref={endRef} />
      </div>
      <form className={`composer ${empty ? "center" : ""}`} onSubmit={send}>
        <input value={text} onChange={(e) => setText(e.target.value)} placeholder="Ask anything" autoFocus />
      </form>
    </main>
  );
}
