# The decision tree: your privacy-law areas in 3 minutes (unsupported languages: Rust, C#, Swift, Kotlin)

Answer yes/no/unsure. Your "yes" answers are your sector overlay; feed them
to Prompt 3.

## Part 1 · The live nine (answered during the workshop)

*What kinds of regulated or sensitive data or processing does this product
touch?*

Each "yes" here flags a privacy-law area for follow-up. Applicability
depends on the company's role, users, data, geography, thresholds, and
processing purpose — a "yes" means "investigate this legal area," not "this
law applies."

1. **Health & wellness:** Does the code collect, store, transmit, infer, or share health or wellness information—including symptoms, diagnoses, medications, mental health, reproductive health, sleep, or fitness data?
   *Potential legal areas to investigate:* FTC Health Breach Notification Rule; Washington My Health My Data Act and similar state health-data laws; HIPAA only if you serve covered entities (plans, providers).
2. **Financial information:** Does the code handle bank-account information, payment information, financial-account credentials, credit information, lending information, or information used to assess financial eligibility?
   *Potential legal areas to investigate:* GLBA (financial institutions); FCRA (credit and eligibility decisions).
3. **Children:** Is the product directed to children under 13, or does the company knowingly collect personal information from children under 13?
   *Potential legal areas to investigate:* COPPA; state age-appropriate design laws.
4. **Geography:** Where are your users located? Do you intentionally offer the product to users in states with applicable comprehensive privacy laws, or in other countries, including the EU/EEA?
   *Potential legal areas to investigate:* state comprehensive privacy laws (the list of states grows every year — the assessment identifies which apply); GDPR/UK GDPR for EU/EEA and UK users.
5. **Advertising & third parties** (technical transmission and tracking): Does the code send personal information or identifiers to advertising, analytics, attribution, data-broker, social-media, or other third-party SDKs/services?
   *Potential legal areas to investigate:* "sale/share" opt-out duties and universal opt-out signals in state laws; FTC Act Section 5.
6. **Data sharing** (business-purpose disclosure): Does the code disclose personal information to third parties for purposes other than providing the service requested by the user?
   *Potential legal areas to investigate:* disclosure and opt-out duties in state comprehensive laws; your own privacy notice becomes binding here.
   *Note: #5 asks what the code transmits; #6 asks why the business discloses. Both are independently useful during a code scan.*
7. **Education:** Does the product receive, store, or process information from schools, educational institutions, students, or education records on behalf of a school?
   *Potential legal areas to investigate:* FERPA, where the information is an education record maintained by an educational institution (or a party acting for it) — FERPA generally attaches through the institution's federal funding; state student-privacy laws (e.g. SOPIPA).
8. **Biometrics:** Does the code collect or process fingerprints, face/voice templates, iris/retina information, or other biometric identifiers used to identify an individual?
   *Potential legal areas to investigate:* Illinois BIPA; Texas and Washington biometric laws; biometric provisions in state comprehensive laws.
9. **Precise location:** Does the code collect precise GPS/location information, continuously track location, or derive sensitive information from location history?
   *Potential legal areas to investigate:* precise location is itself sensitive data under most state comprehensive laws; location history can also create sensitive inferences (health, religion, relationships) that trigger further laws, including health-data laws such as Washington My Health My Data.

## Part 2 · Risk assessment (after the workshop)

*How is that data actually handled?*

These don't point at one law; they find the risks your mini risk assessment
(Prompt 5) and fix roadmap (Prompt 7) should cover.

10. **Sensitive personal information:** Does the code collect information such as government IDs, authentication credentials, racial/ethnic information, religious beliefs, sexual orientation, health information, precise location, or other information that may receive heightened protection?
11. **Tracking & identifiers:** Does the code use persistent identifiers, device IDs, advertising IDs, cookies, pixels, fingerprinting, session replay, or cross-context tracking?
12. **AI/LLM processing:** Does the code send user-provided information, prompts, uploaded files, conversations, or personal information to an AI model or external AI provider?
13. **Logs & debugging:** Could production logs, error-monitoring systems, analytics events, crash reports, or debugging tools capture personal or sensitive information?
14. **Retention & deletion:** Does the code have mechanisms for data retention, deletion, account closure, or user data export—or does personal information remain indefinitely in databases, backups, logs, or third-party systems?
15. **Access controls:** Can employees, contractors, developers, support staff, or third-party services access production personal information?
16. **Data transfers:** Does personal information move between systems, vendors, countries, regions, or cloud environments?
17. **User-generated content:** Can users upload or submit free-form text, images, audio, video, documents, or other content that could contain personal information?
18. **Data inference:** Does the product infer sensitive characteristics, preferences, health conditions, financial characteristics, behavior, location, or other attributes about users—even if those attributes aren't explicitly collected?
19. **Vendors & subprocessors:** Does the code send personal information to cloud providers, SaaS vendors, analytics platforms, AI providers, payment processors, support tools, or other service providers? (This bridges code → vendor → contract/DPA → privacy notice.)
20. **Purpose & reuse:** Is personal information used for a purpose that is different from why it was collected or reasonably expected by the user—including product analytics, model training, advertising, profiling, or new product features?

Then: Prompt 5 identifies your riskiest data flow, and Prompt 7 turns the
findings into an ordered remediation plan. The whole progression:
**Discover → Classify → Assess → Prioritize → Fix → Sustain.**

HIPAA almost never applies to consumer wellness apps. That is NOT the same
as unregulated: questions 1 and 4–6 usually flag the areas that do.

Alternative: an AI coding assistant can do steps 1-3 for you. Prompt:
"Read this repo and produce the Bearer-style inventory in the table above,
citing file:line for every row; mark anything uncertain." Label the result
AI-assisted and verify every row before relying on it.
