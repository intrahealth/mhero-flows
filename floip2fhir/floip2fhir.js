const {
  FlowResultsClient,
  fhirQuestionnaireResponsesFromFlowResultsResponseSet,
  FlowResultsToFHIRConverter,
  FlowResultsDataPackage,
  parse
} = require('@floip/flow-results-utils')
const nconf = require('nconf')
const fs = require('fs')
const async = require('async')
nconf.argv()

class floip {
  constructor() {
    this.server = '',
    this.authHeader = ''
    this.pckgData = ''
    this.respData = ''
  }
  convertFromFile() {
    let bundle = {
      resourceType: 'Bundle',
      type: 'batch',
      entry: []
    }
    const frPackage = parse(FlowResultsDataPackage, this.pckgData);
    const converter = new FlowResultsToFHIRConverter(frPackage);
    const fhirQuestionnaire = converter.toQuestionnaire();
    bundle.entry.push(fhirQuestionnaire)

    if(this.respData) {
      const fhirQuestionnaireResponse = converter.toQuestionnaireResponse(this.respData);
      bundle.entry.push(fhirQuestionnaireResponse)
    }
    console.log(JSON.stringify(bundle, 0, 2));
  }

  async convertFromServer() {
    let bundle = {
      resourceType: 'Bundle',
      type: 'batch',
      entry: []
    }
    const client = new FlowResultsClient(this.server, this.authHeader);
    const packageIds = await client.getPackagesIds().then((r) => r.data).catch((e) => { console.error('Error', e);});
    if(!packageIds) {
      return callback();
    }
    async.eachSeries(packageIds, async (packageId, nxtId) => {
      const frPackage = await client.getPackage(packageId).then((r) => r.data).catch((e) => {
        console.error('Error', e);
        return nxtId();
      });

      const converter = new FlowResultsToFHIRConverter(frPackage);
      const fhirQuestionnaire = converter.toQuestionnaire();
      bundle.entry.push(fhirQuestionnaire)
      if(frPackage && this.includeResponses) {
        // Convert all Responses to QuestionnaireResponse
        let options = {
          'page[size]': '500' // Adjust page size for memory consumption, up to the limits of server. Larger page sizes will be faster but consume more memory in the converter.
        };
        if(this.timestamp) {
          options['filter[start-timestamp]'] = this.timestamp
        }
        let qnresp;
        await fhirQuestionnaireResponsesFromFlowResultsResponseSet(frPackage, client.getResponsesFromPackage(frPackage, options),  qtnRespnses => {
          qnresp = qtnRespnses;
          }
        ).catch((e) => {
          console.error('Error', e);
          return nxtId();
        });
        bundle.entry = bundle.entry.concat(qnresp)
        return nxtId();
      } else {
        return nxtId();
      }
    }, () => {
      console.log(JSON.stringify(bundle, 0, 2));
    });
  }
}


let server = nconf.get('server')
let authHeader = nconf.get('authHeader')
let includeResponses = nconf.get('includeResponses')
let pckg = nconf.get('frPackage')
let responses = nconf.get('flowResponses')
if(pckg) {
  let pckgPromise = new Promise((resolve, reject) => {
    fs.readFile( pckg, ( err, data ) => {
      if(err) {
        return reject()
      }
      return resolve(JSON.parse(data))
    })
  })

  let respPromise = new Promise((resolve, reject) => {
    if(!responses) {
      return resolve(null)
    }
    fs.readFile( responses, ( err, data ) => {
      if(err) {
        return reject()
      }
      return resolve(JSON.parse(data))
    })
  })

  Promise.all([pckgPromise, respPromise]).then((resp) => {
    const floipObj = new floip()
    floipObj.pckgData = resp[0]
    if(resp[1]) {
      floipObj.respData = resp[1]
    }
    floipObj.convertFromFile()
  })
} else if(server) {
  const floipObj = new floip()
  floipObj.server = server
  if(authHeader) {
    floipObj.authHeader = authHeader
    floipObj.includeResponses = includeResponses
  }
  floipObj.convertFromServer()
} else {
  console.log('Cant do anything');
}
