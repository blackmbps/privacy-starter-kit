# Privacy Program Starter Kit — Scan It, Map It, Ship It

Build a privacy program from your own codebase in 45 minutes. From the
workshop by Zach (OQP Solutions).

## Quick start (2 minutes, do this BEFORE the session)

```bash
# 1. Install Bearer CLI (macOS/Linux)
curl -sfL https://raw.githubusercontent.com/Bearer/bearer/main/contrib/install.sh | sh
sudo mv ./bin/bearer /usr/local/bin/   # the installer puts it in ./bin — move it onto your PATH

# 2. Verify
bearer version

# 3. Warm-up scan on the included sample app
./scan.sh sample-app
```

Windows: use WSL, or Docker: `docker pull bearer/bearer`.

## What's here

| Path | What it is |
|---|---|
| `sample-app/` | GlowJournal, a deliberately imperfect wellness app with planted privacy findings |
| `scan.sh` | Scanner wrapper: privacy + security reports, language census, diagnostic bundle |
| `prompt-pack/` | 7 prompts that turn scan JSON into your privacy program documents |
| `worksheets/` | The 8-question decision tree + manual inventory worksheet (Rust/C#/Swift/Kotlin) |
| `.github/workflows/privacy.yml` | The CI check: every pull request gets a privacy review |
| `outputs/` | Where scan JSON and your diagnostic land (gitignored) |

## The method

1. **Scan It** — `./scan.sh path/to/your-app` discovers what personal data
   your code touches and which third parties receive it. It reads code only,
   never your data or your database.
2. **Map It** — feed `outputs/dataflow.json` to the prompt pack to generate
   your inventory, flow map, classification register, vendor register, mini
   risk assessment and an evidence-based privacy notice draft.
3. **Ship It** — copy `.github/workflows/privacy.yml` into your repo. From
   then on, every pull request that adds a new sensitive data flow fails the
   check until someone looks at it.

## Supported languages

Bearer free CLI: JavaScript/TypeScript, Python, Ruby, Java, PHP, Go.
Rust, C#, Swift, Kotlin: `scan.sh` warns you (an empty scan is NOT a clean
bill) — use `worksheets/data-inventory-worksheet.md`.

## Honest limits

- The scanner reads code, not stored data: free-text fields and legacy tables
  are blind spots. They go on your roadmap, not under the rug.
- The generated documents are drafts for you (and counsel) to review, not
  legal advice.
