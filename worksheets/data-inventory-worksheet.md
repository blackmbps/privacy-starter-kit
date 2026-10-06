# Manual data inventory worksheet (unsupported languages: Rust, C#, Swift, Kotlin)

Bearer's free CLI cannot scan your language, and an empty scan is NOT a clean
bill. Build the inventory by hand in ~10 minutes; use the sample app's
generated inventory as the model.

1. Open your data models / structs / entities. List every field that
   describes a person (name, email, DOB, location, health, money, device IDs).
2. Grep your codebase for outbound calls: api., http, client, sdk key names
   (openai, stripe, sentry, segment, firebase, amplitude...). Each hit is a
   potential third-party flow: note WHAT data goes in the request.
3. List your data stores (DBs, caches, buckets, localStorage/UserDefaults).
4. Fill the same table as Prompt 1: element | category | collected where |
   stored where | who receives it.

Alternative: an AI coding assistant can do steps 1-3 for you. Prompt:
"Read this repo and produce the Bearer-style inventory in the table above,
citing file:line for every row; mark anything uncertain." Label the result
AI-assisted and verify every row before relying on it.


Alternative: an AI coding assistant can do steps 1-3 for you. Prompt:
"Read this repo and produce the Bearer-style inventory in the table above,
citing file:line for every row; mark anything uncertain." Label the result
AI-assisted and verify every row before relying on it.
