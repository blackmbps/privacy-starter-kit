// GlowJournal browser code.
// PLANTED HIGH: PII kept in localStorage
function saveProfile(email, dateOfBirth) {
  localStorage.setItem('userEmail', email);
  localStorage.setItem('userDOB', dateOfBirth);
  console.log('cached profile for ' + email);
}
