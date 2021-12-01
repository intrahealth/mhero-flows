### Supported Use Cases

As a vital communications and health worker registry platform. mHero is used across diverse use cases to communicate both routine and urgent messages to health workers; target messages** to health workers based on cadre, location, or skill set; collect critical information that powers resilient health systems; and build capacity and provide support.

Current mHero provides the ability to 
* Convert RapidPro contacts into FHIR Practitioner resources, and
* Perform one-way or two-way sychronization, and
* Convert RapidPro flow runs into Questionnaire Responses.

This means that mHero has built-in features to accomplish several use cases. 

| **Use Case** | **FHIR Resources** | Methodology/Workflow |
| --- | --- | --- |
| Sync health worker contacts between RapidPro and a health worker registry | Practitioner, Location | mHero two-way syncs contacts (and groups) with RapidPro. |
| Weekly reporting reminder to facility leads | Practitioner, Location, Communication | One-way messages are stored in FHIR as Communication. |
| Broadcast one-way messages to CHWs from a point-of-service system | Practitioner, Location, Communication | POS system syncs contacts with the health worker registry.
| Facility report on staff and patients vaccinated | Practitioner, Location |  |
| Aggregate report on COVID-19 hospitalizations | Practitioner, Location |  |
| Health workers register to do reporting via SMS/WhatsApp | Practitioner, PractitionerRole,  QuestionnaireResponse | The Practitioner and PractitionerRole responses from a Questionnaire and QuestionnaireResponse are converted from FLOIP/RapidPro. |
| Health workers self-report on vaccination status and stocks | Patient, Immunization, Practitioner,  QuestionnaireResponse | Practitioner is both Practitioner and Patient for immunization recording purposes. |
| Patient Case Report Form for COVID-19 | Practitioner, Location, Observation | Practitioner reports on Patient resource. |


### Examples

In the repository under /covid, there are examples FLOIP and RapidPro flows that address several of the above use cases.


### Unsupported


A single resource for Immunization is extracted from a Questionnaire and QuestionnaireResponse converted from FLOIP/RapidPro. **Optional**: Location, Organization, Encounter, etc



| **Use Case** | **FHIR Resources** | Methodology/Workflow |


 and adds summary information about COVID-19 test results in Encounter, DiagnosticResult, Observation.



### Advanced Methodology and Workflows


The first step in communicating with health workers through mHero and FLOIP or RapidPro is to 

TBD

**Sync health worker contacts between RapidPro and a health worker registry**

**Weekly reporting reminder to facility leads**

**Broadcast one-way messages to CHWs from a point-of-service system**

**Facility report on staff and patients vaccinated**

**Aggregate report on COVID-19 hospitalizations**

**Health workers register to do reporting via SMS/WhatsApp**

**Health workers self-report on vaccination status and stocks**

**Patient Case Report Form for COVID-19**
