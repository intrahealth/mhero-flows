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

Example Generate Questionnaire From response files
```bash
node floip2fhir.js --frPackage ./exampleFlows/frPackage.json --flowresponses ./exampleFlows/flowresults.json
```

Example Generate Questionnaire From Server
```bash
sudo ./floip2fhir.js --server https://floip-server --authHeader 'Token XXXXYYYYZZZ'
```
