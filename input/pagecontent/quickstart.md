This page documents the test steps for the mHero Flows Library and FHIR Interoperability Framework (mhero-flows) IG and also and emphasizes the methodology for new learners about using FHIR-oriented artifacts with short messaging systems.

> Where paths in the repository start with a slash (/), what is meant is the root of the repository, not the filesystem.

## Rapidpro Contacts to FHIR Practitioners Conversion

mHero has a method called syncContacts which is scheduled to run and synchronize contacts between Rapidpro and mHero. mHero does below steps to achieve this:

* Pulls all FHIR Practitioners.
* Pulls all Rapidpro contacts.
* Loop through each FHIR Practitioner and create a Rapidpro add contact request that includes a field specifying the entity type I.e Practitioner, Patient e.t.c and entity ID which is the FHIR Practitioner ID, and then makes a post request to rapidpro to create a Practitioner as a contact in Rapidpro. The respective Rapidpro contact uuid is also added to the corresponding FHIR Practitioner as an Identifier with system being “http://app.rapidpro.io/contact-uuid” and the value being the contact uuid and then a Practitioner get updated as well.
* mHero also checks if two way synchronization is enabled, if it is enabled then it loops through all the rapidpro contacts to see any contact that is in rapidpro and missing in mHero,  if it finds any then it converts that Rapidpro contact to a FHIR Practitioner with the Rapidpro contact uuid being added as an identifier to the FHIR Practitioner then a Practitioner is saved into FHIR server. The respective FHIR Practitioner ID and entity types are also added back to the corresponding Rapidpro contact as fields and the Rapidpro gets updated with these changes on the contact.


## Rapidpro Flow Results to FHIR Questionnaire Responses Conversion

mHero has a method called syncWorkflowRunMessages that is scheduled to pull rapidpro flow results and convert them to Communications and Questionnaire Responses. 

* mHero starts by pulling Rapidpro flow results using the Rapidpro runs.json endpoint. mHero loops through each run, and for each run mHero gets flow Definition for a respective flow run to help with decoding a flow results. 
* mHero also queries FHIR server to get a Practitioner involved in the flow run using the Rapidpro contact uuid. 
* Finally, mHero converts a flow result to a Questionnaire Response. Since rapidpro flow results doesn’t have results data types, then everything is treated as a string inside the Questionnaire Response. mHero uses Rapidpro flow run uuid as the Questionnaire Response ID.


## Methodology and Workflows

TBD

**Sync health worker contacts between RapidPro and a health worker registry**

**Weekly reporting reminder to facility leads**

**Broadcast one-way messages to CHWs from a point-of-service system**

**Facility report on staff and patients vaccinated**

**Aggregate report on COVID-19 hospitalizations**

**Health workers register to do reporting via SMS/WhatsApp**

**Health workers self-report on vaccination status and stocks**

**Patient Case Report Form for COVID-19**


## Workflow Status

All builds should pass. The status badges show the outcomes from the GitHub Actions directly from GitHub.

| **Outcome** | **Workflow** |
| --- | --- |
| ![build ig](https://github.com/intrahealth/mhero-flows/workflows/build_fsh/badge.svg) | Build FSH using Sushi |
| ![build ddcc fsh](https://github.com/intrahealth/mhero-flows/workflows/build_fsh/badge.svg) | Build FSH using Sushi |
| ![build ddcc ig](https://github.com/intrahealth/mhero-flows/workflows/build_ig/badge.svg) | Build IG using Publisher |
