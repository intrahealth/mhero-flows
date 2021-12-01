### Utilities


#### RapidPro Flows to FLOIP

A proof-of-concept is available to convert RapidPro flows to the Flow Standard. See https://github.com/FLOIP/flow-utils


#### CLI for Converting Flow Responses (FLOIP) to FHIR Questionnaire

The repository includes a CLI based on [FLOIP Utils](https://github.com/FLOIP/flow-utils) to convert FLOIP responses to FHIR Questionnaire and QuestionnaireResponses.


###### Installation

First, clone the repository, 
```bash
git clone https://github.com/intrahealth/mhero-flows.git
```

```bash
cd mhero-flows/floip2fhir
```

```bash
npm i
```

##### Usage

If only frPackage is included then the output will be a Questionnaire resource only, but if both frPackage and flowResponses are included then the response will be a Questionnaire and QuestionnaireResponse resources

Example Generate Questionnaire and QuestionnaireResponse From local JSON files of flow package and flow responses
```bash
node floip2fhir.js --frPackage ./exampleFlows/frPackage.json --flowResponses ./exampleFlows/flowresults.json > ./exampleFlows/QuestionnaireBundle.json
```

If you specify server address and want both Questionnaire and QuestionnaireResponse resources then you will need to include an option 'includeResponses'

Example Generate Questionnaire and QuestionnaireResponse From FLOIP Server
```bash
node ./floip2fhir.js --includeResponses --server https://floip-server --authHeader 'Token XXXXYYYYZZZ'
```