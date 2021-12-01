### Use Cases

As a vital communications and health worker registry platform. mHero is used across diverse use cases to communicate both routine and urgent messages to health workers; target messages to health workers based on cadre, location, or skill set; collect critical information that powers resilient health systems; and build capacity and provide support.

Current mHero provides the ability to 
* Convert RapidPro contacts into FHIR Practitioner resources, and
* Perform one-way or two-way sychronization, and
* Convert RapidPro flow runs into FHIR Questionnaires and Questionnaire Responses.

There are additional command line utilities to:
* Convert RapidPro flows to FLOIP flows.
* Convert FLOIP flows to FHIR Questionnaires and QuestionnaireResponses.

This means that mHero has built-in features to accomplish several use cases. 

### Supported Use Cases

| **Prototypical Use Case** | **Status** |
| --- | --- |
| Sync health worker contacts between RapidPro and a health worker registry | Capability built-into mHero. Settings enable one-way or two-way sync. |
| Weekly reporting reminder to facility leads | Capability built-into mHero. Flow must be authored in FLOIP/RapidPro. |
| Broadcast one-way messages to CHWs from a point-of-service system | API is available. Requires integration of the POS with mHero. |
| Facility report on staff and patients vaccinated | A demo flow is provided. |
| Aggregate report on COVID-19 hospitalizations | A demo flow is provided. |
| Health workers register to do reporting via SMS/WhatsApp | A demo flow is provided. |
| Health workers self-report on vaccination status and stocks | A demo flow is provided. |
| Patient Case Report Form for COVID-19 | A demo flow is provided. |

### Provided Examples

In the repository under /covid, there are examples FLOIP and RapidPro flows that address several of the above use cases. There are both FLOIP and RapidPro versions of the flows.

### How mHero Stores Content in FHIR

* Health workers (contacts) in RapidPro and FLOIP are by default stored as Practitioners. 
* Flows are stored in FHIR as Questionnaires. Flow runs are stored as QuestionnaireResponses. 

### Advanced -- Structured Data Capture

There is an Implementation Guide in the FHIR community that defines how to extract data in any resource to another type of resource. This is termed Structured Data Capture (SDC). There are [three mechanisms](http://build.fhir.org/ig/HL7/sdc/extraction.html):

* **Observation-based**
    * This process converts all QuestionnaireResponses to Observations. This is simple but does not convert to any base resources that would be used by an EHR or other system.
* **Definition-based**: In this mechanism, either the Questionnaire or QuestionnaireResponses contains attributes for conversion. 
    * This places the burden of conversion between resources types on the Questionnaire author. A demonstration copied from the SDC repository is provided. 
    * Note that at the time of writing that this capability is not available in an open source API-based solution. (It is available in the Google Android FHIR SDK but this is not applicable to short messaging applications.) See: https://confluence.hl7.org/display/FHIRI/SDC+Implementations
* **Structure-map based**
    * This is the most flexible but requires using the FHIR Mapping Language inside a StructureMap resource. * There is some support, for example from [Matchbox](https://github.com/ahdis/matchbox). 
    * This is also the most complicated approach as it requires learning a new FHIR-oriented programming language. Questionnaires must be written for FHIR and then StructureMaps manually created in addition.
