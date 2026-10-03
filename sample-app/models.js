// GlowJournal user model. Structured fields: Bearer reads named fields on
// classes, which is why this file lights up the inventory.
class User {
  constructor(data) {
    this.email = data.email;
    this.fullName = data.fullName;
    this.dateOfBirth = data.dateOfBirth;
    this.phoneNumber = data.phoneNumber;
    this.moodScore = data.moodScore;
    this.journalEntry = data.journalEntry;
  }
}

class JournalEntry {
  constructor(data) {
    this.userEmail = data.userEmail;
    this.entryText = data.entryText;
    this.sleepHours = data.sleepHours;
    this.anxietyLevel = data.anxietyLevel;
  }
}

module.exports = { User, JournalEntry };
