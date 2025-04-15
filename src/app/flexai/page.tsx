"use client"

import {Button} from "@/components/ui/button";
import {Input} from "@/components/ui/input";
import {useEffect, useState} from "react";

const FlexAIPage = () => {
  const [messages, setMessages] = useState<string[]>([
    "Hi, I’m FlexAI. How can I help you thrive today?",
    "Placeholder message from user.",
    "Placeholder response from FlexAI.",
  ]);
  const [newMessage, setNewMessage] = useState("");

  const handleSendMessage = () => {
    if (newMessage.trim() !== "") {
      setMessages([...messages, newMessage]);
      setNewMessage("");
    }
  };

  // Scroll to bottom on new message
  useEffect(() => {
    const chatContainer = document.getElementById("chat-container");
    if (chatContainer) {
      chatContainer.scrollTop = chatContainer.scrollHeight;
    }
  }, [messages]);

  return (
    <div className="flex flex-col h-screen p-4">
      <div id="chat-container" className="flex-grow overflow-y-auto">
        {messages.map((message, index) => (
          <div
            key={index}
            className={`mb-2 p-2 rounded-lg ${
              index % 2 === 0 ? "bg-secondary text-secondary-foreground self-start" : "bg-muted text-muted-foreground self-end"
            }`}
          >
            {message}
          </div>
        ))}
      </div>

      <div className="flex items-center mt-4">
        <Input
          type="text"
          placeholder="Type your message..."
          className="flex-grow mr-2"
          value={newMessage}
          onChange={(e) => setNewMessage(e.target.value)}
        />
        <Button onClick={handleSendMessage}>Send</Button>
      </div>
    </div>
  );
};

export default FlexAIPage;
