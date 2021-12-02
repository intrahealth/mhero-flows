### Use Cases

As a vital communications and health worker registry platform. mHero is used across diverse use cases to communicate both routine and urgent messages to health workers; target messages to health workers based on cadre, location, or skill set; collect critical information that powers resilient health systems; and build capacity and provide support.

### mHero Architecture

Understanding where to begin requires selecting an approach based on the mHero Architecture.

The mHero platform relies on iHRIS. iHRIS v5 uses a FHIR server for its native data structures and API. All aspects of a health worker (what FHIR terms a Practitioner) including their roles, work history, qualifications, and other form-building aspects of the iHRIS interface use FHIR. This makes it easy to customize iHRIS. See the default iHRIS forms [here](https://github.com/iHRIS/iHRIS/tree/master/ig/input/fsh).

The mHero connector for short messaging platforms is [emNutt](https://github.com/intrahealth/emNutt). emNutt connects to either a FLOIP-compatible server or RapidPro/TextIt.in servers. However, their capabilities differ.

### mHero Capabilities

Current mHero provides the ability to 
* Convert (only) RapidPro contacts into FHIR Practitioner resources, and
* Perform one-way or two-way sychronization, and
* Convert RapidPro or FLOIP flow runs into FHIR Questionnaire Responses.

> mHero does not currently support syncing with FLOIP contacts.

In addition, there are additional command line utilities to:
* Convert RapidPro flows to FLOIP flows.
* Convert FLOIP flows to FHIR Questionnaires and QuestionnaireResponses.

What this means is that mHero has built-in features to accomplish several use cases already built into the platform.

### Where to Start using FHIR with mHero

**If the use case is primarily based on short messaging**: Use cases involving primarily or starting with short messages can be migrated from RapidPro or FLOIP platforms to mHero. Starting from this approach is built into mHero and requires less customization.

In this approach, questionnaires are authored in, for example, the [FLOIP Builder](https://github.com/FLOIP/flow-builder) or in [TextIt.in](https://textit.com) or [RapidPro.io](https://community.rapidpro.io).

**If the use case is primarily based on health information systems**: Use cases that start with FHIR and health information systems generally would have in mind a very specific programmatic (in the public health sense) use case where short messaging is one of other data capture processes. In this approach, questionnaires may begin from the HIS perspective and be migrated to FHIR. Starting from this advanced approach requires more planning and potentially additional coding.

In this approach, questionnaires are authored in [FSH](https://fshschool.org), [LHC Forms](https://github.com/lhncbc/lforms), or [skjema-nb-NO](https://formdesigner.helsenorgelab.no) Form Designer, among other options.

The FHIR Questionnaire builders do not create a RapidPro or FLOIP-compatible artifact. This means that the questionnaires must be made twice if they require short messaging support. In addition, and perhaps most importantly, the FHIR Questionnaires do not populate other core resources, such as Patient, Encounter, or DiagnosticResult. There are structured data capture approaches to doing so but they require additional expertise.

### Supported Use Cases for Starting with Short Messaging

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

In the repository under /covid, there are examples FLOIP and RapidPro flows that address several of the above use cases. There are both FLOIP and RapidPro versions of the flows. These flows can be loaded into FLOIP or RapidPro and customized in the user's preferred interface.

### How mHero Stores Content in FHIR

* Health workers (contacts) in RapidPro and FLOIP are by default stored as Practitioners. 
* Flows are stored in FHIR as Questionnaires. Flow runs are stored as QuestionnaireResponses. 

### Advanced -- Structured Data Capture for Starting with FHIR

There is an Implementation Guide in the FHIR community that defines how to extract data in any resource to another type of resource. This is termed Structured Data Capture (SDC). There are [three mechanisms](http://build.fhir.org/ig/HL7/sdc/extraction.html):

* **Observation-based**
    * This process converts all QuestionnaireResponses to Observations. This is simple but does not convert to any base resources that would be used by an EHR or other system.
* **Definition-based**: In this mechanism, either the Questionnaire or QuestionnaireResponses contains attributes for conversion. 
    * This places the burden of conversion between resources types on the Questionnaire author. A demonstration copied from the SDC repository is provided. 
    * Note that at the time of writing that this capability is not available in an open source API-based solution. (It is available in the Google Android FHIR SDK but this is not applicable to short messaging applications.) See: https://confluence.hl7.org/display/FHIRI/SDC+Implementations
* **Structure-map based**
    * This is the most flexible but requires using the FHIR Mapping Language inside a StructureMap resource. * There is some support, for example from [Matchbox](https://github.com/ahdis/matchbox). 
    * This is also the most complicated approach as it requires learning a new FHIR-oriented programming language. Questionnaires must be written for FHIR and then StructureMaps manually created in addition.
