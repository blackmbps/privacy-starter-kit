# The 8-question decision tree (your laws, in 3 minutes)

Answer yes/no/unsure. Your "yes" answers are your sector overlay; feed them
to Prompt 3.

!. Health & wellness: Does the code collect, store, transmit, infer, or share health or wellness information—including symptoms, diagnoses, medications, mental health, reproductive health, sleep, or fitness data?
2. Financial information: Does the code handle bank-account information, payment information, financial-account credentials, credit information, lending information, or information used to assess financial eligibility?
3. Children: Is the product directed to children under 13, or does the company knowingly collect personal information from children under 13?
4. Geography: Where are your users located? Do you intentionally offer the product to users in particular U.S. states or countries, including the EU/EEA?
5. Advertising & third parties: Does the code send personal information or identifiers to advertising, analytics, attribution, data-broker, social-media, or other third-party SDKs/services?
6. Data sharing: Does the code disclose personal information to third parties for purposes other than providing the service requested by the user?
7. Education: Does the product receive, store, or process information from schools, educational institutions, students, or education records on behalf of a school?
8. Biometrics: Does the code collect or process fingerprints, face/voice templates, iris/retina information, or other biometric identifiers used to identify an individual?
9. Precise location: Does the code collect precise GPS/location information, continuously track location, or derive sensitive information from location history?
10. Sensitive personal information: Does the code collect information such as government IDs, authentication credentials, racial/ethnic information, religious beliefs, sexual orientation, health information, precise location, or other information that may receive heightened protection?
11. Tracking & identifiers: Does the code use persistent identifiers, device IDs, advertising IDs, cookies, pixels, fingerprinting, session replay, or cross-context tracking?
12. AI/LLM processing: Does the code send user-provided information, prompts, uploaded files, conversations, or personal information to an AI model or external AI provider?
13. Logs & debugging: Could production logs, error-monitoring systems, analytics events, crash reports, or debugging tools capture personal or sensitive information?
14. Retention & deletion: Does the code have mechanisms for data retention, deletion, account closure, or user data export—or does personal information remain indefinitely in databases, backups, logs, or third-party systems?
15. Access controls: Can employees, contractors, developers, support staff, or third-party services access production personal information?
16. Data transfers: Does personal information move between systems, vendors, countries, regions, or cloud environments?
17. User-generated content: Can users upload or submit free-form text, images, audio, video, documents, or other content that could contain personal information?
18. Data inference: Does the product infer sensitive characteristics, preferences, health conditions, financial characteristics, behavior, location, or other attributes about users—even if those attributes aren't explicitly collected?

HIPAA almost never applies to consumer wellness apps. That is NOT the same
as unregulated: questions 1 and 4-6 usually apply instead.
