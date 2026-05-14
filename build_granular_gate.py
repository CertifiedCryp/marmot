import os
from xai_sdk import Client
from xai_sdk.chat import user, system

client = Client(api_key=os.getenv("XAI_API_KEY"))

chat = client.chat.create(
    model="grok-3",          # Using grok-3 for now (very capable)
)

chat.append(system(
    """You are an expert systems engineer building the proper granular_gate for L1QD single-spread arbitrage.

Requirements:
- Use Cap'n Proto (granular_gate.capnp)
- Core logic in Rust
- Clean Particle Filter + resonance_lock
- Ready to interface with Zig executor
- Keep code modular and well-commented
- Maintain "never taken a loss" standard"""
))

chat.append(user(
    """Generate a complete, clean src/main.rs for ~/grokular_gate/ using the Cap'n Proto schema.
Include Particle Filter, resonance calculation, and Cap'n Proto read/write logic.
Return only the Rust code."""
))

print("=== Generating granular_gate with Grok ===\n")

for response, chunk in chat.stream():
    if chunk.content:
        print(chunk.content, end="", flush=True)
