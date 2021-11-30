### Supported Use Cases

| **Use Case** | **FHIR Resources** | Methodology/Workflow |
| --- | --- | --- |
| Sync health worker contacts between RapidPro and a health worker registry | Practitioner, Location | mHero two-way syncs contacts (and groups) with RapidPro. |
| Weekly reporting reminder to facility leads | Practitioner, Location, Communication | Sync as above. One-way messages are stored in FHIR as Communication. |
| Broadcast one-way messages to CHWs from a point-of-service system | Practitioner, Location, Communication | POS system syncs contacts with the health worker registry. If required, one-way messages are stored in FHIR as Communication.
| Facility report on staff and patients vaccinated | Practitioner, Location |  |
| Aggregate report on COVID-19 hospitalizations | Practitioner, Location |  |
| Health workers register to do reporting via SMS/WhatsApp | Practitioner, PractitionerRole, Questionnaire, QuestionnaireResponse | The Practitioner and PractitionerRole responses from a Questionnaire and QuestionnaireResponse are converted from FLOIP/RapidPro. |
| Health workers self-report on vaccination status and stocks | Patient, Immunization, Practitioner, Questionnaire, QuestionnaireResponse | Practitioner is both Practitioner and Patient for immunization recording purposes. A single resource for Immunization is extracted from a Questionnaire and QuestionnaireResponse converted from FLOIP/RapidPro. **Optional**: Location, Organization, Encounter, etc |
| Patient Case Report Form for COVID-19 | Practitioner, Location, Patient, Encounter, DiagnosticResult, Observation | Practitioner reports on Patient resource, and adds summary information about COVID-19 test results in Encounter, DiagnosticResult, Observation. |

### Methodology and Workflows

TBD

**Sync health worker contacts between RapidPro and a health worker registry**

**Weekly reporting reminder to facility leads**

**Broadcast one-way messages to CHWs from a point-of-service system**

**Facility report on staff and patients vaccinated**

**Aggregate report on COVID-19 hospitalizations**

**Health workers register to do reporting via SMS/WhatsApp**

**Health workers self-report on vaccination status and stocks**

**Patient Case Report Form for COVID-19**
