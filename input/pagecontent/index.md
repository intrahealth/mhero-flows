<!-- ### mHero Flows Library and FHIR Interoperability Framework (mhero-flows) -->

<!-- <br/><br/>
<img src="mherlogo.png" class="center" width="350">
<br/><br/> -->

### Objectives

This Implementation Guide (IG) demonstrates a prototypical framework for working with mHero and it's FHIR backend and short messages in FLOIP or RapidPro format.

The tooling is meant to provide a basis to understand the reference tooling and how to test their own profiled mHero workflows.

### Use Cases

| **Use Case** | **FHIR Resources** | Methodology/Workflow |
| --- | --- | --- |
| Sync health worker contacts between RapidPro and a health worker registry | Practitioner, Location, Organization | mHero two-way syncs contacts (and groups) with RapidPro. |
| Weekly reporting reminder to facility leads | Practitioner, Location, CommunicationRequest | Sync as above. One-way messages are stored in FHIR as CommunicationRequest. |
| Broadcast one-way messages to CHWs from a point-of-service system | Practitioner, Location, CommunicationRequest | POS system syncs contacts with the health worker registry. If required, one-way messages are stored in FHIR as CommunicationRequest.
| Facility report on staff and patients vaccinated | Practitioner, Location | Definition-based extraction.
| Aggregate report on COVID-19 hospitalizations | Practitioner, Location | Definition-based extraction. |
| Health workers register to do reporting via SMS/WhatsApp | Practitioner, PractitionerRole, Questionnaire, QuestionnaireResponse | The Practitioner and PractitionerRole responses from a Questionnaire and QuestionnaireResponse are converted from FLOIP/RapidPro. |
| Health workers self-report on vaccination status and stocks | Patient, Immunization, Practitioner, Questionnaire, QuestionnaireResponse, **Optional**: Location, Organization, Encounter, etc | Practitioner is both Practitioner and Patient for immunization recording purposes. A single resource for Immunization is extracted from a Questionnaire and QuestionnaireResponse converted from FLOIP/RapidPro. Definition-based extraction?
| Patient Case Report Form for COVID-19 | Practitioner, Location, Patient, Encounter, DiagnosticResult, Observation | Practitioner reports on Patient resource, and adds summary information about COVID-19 test results in Encounter, DiagnosticResult, Observation. Definition-based extraction? |

### Non-conformance

This tooling does not contain conformance resources. It only contains documentation and tooling although it is formatted using an FHIR Implementation Guide template. This is only for constitency as those that are familiar with FHIR IGs may find navigation more familiar.

### How to Use the Tooling and Testing Framwork

* [**Quick Start**](quickstart.html): This is the starting point to using the tooling using the provided artifacts. This describes the included GitHub Actions which are reusable and should run in any GitHub repository.

* [**Development**](development.html): This is for those that wish to customize and run tests locally.



