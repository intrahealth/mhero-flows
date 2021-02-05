# command line tool for converting flow responses (FLOIP) to fhir questionnaire

Installation
```bash
git clone https://github.com/intrahealth/mhero-flows.git
```

```bash
cd mhero-flows/floip2fhir
```

```bash
npm i
```

if only frPackage is included then the output will be a Questionnaire resource only, but if both frPackage and flowResponses are included then the response will be a Questionnaire and QuestionnaireResponse resources

Example Generate Questionnaire From response files
```bash
node floip2fhir.js --frPackage ./exampleFlows/frPackage.json --flowResponses ./exampleFlows/flowresults.json
```

If you specify server address and want both Questionnaire and QuestionnaireResponse resources then you will need to include an option 'includeResponses'

Example Generate Questionnaire and QuestionnaireResponse From Server
```bash
node ./floip2fhir.js --includeResponses --server https://floip-server --authHeader 'Token XXXXYYYYZZZ'
```