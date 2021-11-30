### FHIR Data and Short Messaging Flows

### Rapidpro Flow Results to FHIR Questionnaire Responses Conversion

mHero has a method called syncWorkflowRunMessages that is scheduled to pull rapidpro flow results and convert them to Communications and Questionnaire Responses. 

* mHero starts by pulling Rapidpro flow results using the Rapidpro runs.json endpoint. mHero loops through each run, and for each run mHero gets flow Definition for a respective flow run to help with decoding a flow results. 
* mHero also queries FHIR server to get a Practitioner involved in the flow run using the Rapidpro contact uuid. 
* Finally, mHero converts a flow result to a Questionnaire Response. Since rapidpro flow results doesn’t have results data types, then everything is treated as a string inside the Questionnaire Response. mHero uses Rapidpro flow run uuid as the Questionnaire Response ID.


