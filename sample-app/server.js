// GlowJournal server. Vibe-coded: it works, and it has never had a privacy pass.
const express = require('express');
const { Pool } = require('pg');
const OpenAI = require('openai');
const Sentry = require('@sentry/node');
const { User, JournalEntry } = require('./models');

// PLANTED CRITICAL: hardcoded API key (fake value, real pattern)
const openai = new OpenAI({ apiKey: 'sk-proj-FAKE1234567890abcdefFAKE1234567890abcdef' });

Sentry.init({ dsn: 'https://fake@fake.ingest.sentry.io/0000000' });

const db = new Pool({ connectionString: process.env.DATABASE_URL });
const app = express();
app.use(express.json());

app.post('/signup', async (req, res) => {
  const user = new User(req.body);
  // PII into PostgreSQL
  await db.query(
    'INSERT INTO users (email, full_name, date_of_birth, phone_number) VALUES ($1,$2,$3,$4)',
    [user.email, user.fullName, user.dateOfBirth, user.phoneNumber]
  );
  // PLANTED HIGH: PII written to logs
  console.log('new signup: ' + user.email + ' born ' + user.dateOfBirth);
  res.json({ ok: true });
});

app.post('/journal', async (req, res) => {
  const entry = new JournalEntry(req.body);
  // PLANTED THIRD-PARTY FLOW: user journal content sent to OpenAI
  const prompt = await openai.chat.completions.create({
    model: 'gpt-4o-mini',
    messages: [{ role: 'user', content: 'Reflect on: ' + entry.entryText }]
  });
  await db.query('INSERT INTO entries (user_email, entry_text, sleep_hours) VALUES ($1,$2,$3)',
    [entry.userEmail, entry.entryText, entry.sleepHours]);
  res.json({ reflection: prompt.choices[0].message.content });
});

app.use((err, req, res, next) => {
  // PLANTED THIRD-PARTY FLOW: request body (may contain PII) sent to Sentry
  Sentry.captureException(err, { extra: { body: req.body } });
  res.status(500).json({ error: 'something broke' });
});

app.listen(3000);
