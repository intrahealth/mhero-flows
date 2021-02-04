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
    const frPackage = parse(FlowResultsDataPackage, this.pckgData);
    const converter = new FlowResultsToFHIRConverter(frPackage);
    // const fhirQuestionnaire = converter.toQuestionnaire();
    // console.log(JSON.stringify(fhirQuestionnaire, null, 2));

    const fhirQuestionnaireResponse = converter.toQuestionnaireResponse(this.respData);
    console.log(JSON.stringify(fhirQuestionnaireResponse, null, 2));
  }

  async convertFromServer() {
    const client = new FlowResultsClient(this.server, this.authHeader);
    const packageIds = await client.getPackagesIds().then((r) => r.data).catch((e) => { console.error('Error', e);});
    if(!packageIds) {
      return callback();
    }
    let questionnaireResponses = []
    async.eachSeries(packageIds, async (packageId, nxtId) => {
      const frPackage = await client.getPackage(packageId).then((r) => r.data).catch((e) => {
        console.error('Error', e);
        return nxtId();
      });

      if(frPackage) {
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
        questionnaireResponses = questionnaireResponses.concat(qnresp)
        return nxtId();
      } else {
        return nxtId();
      }
    }, () => {
      console.log(JSON.stringify(questionnaireResponses, 0, 2));
    });
  }
}


let server = nconf.get('server')
let authHeader = nconf.get('authHeader')
let pckg = nconf.get('frPackage')
let responses = nconf.get('flowresponses')
if(pckg && responses) {
  let pckgPromise = new Promise((resolve, reject) => {
    fs.readFile( pckg, ( err, data ) => {
      if(err) {
        return reject()
      }
      return resolve(JSON.parse(data))
    })
  })

  let respPromise = new Promise((resolve, reject) => {
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
    floipObj.respData = resp[1]
    floipObj.convertFromFile()
  })
} else if(server) {
  const floipObj = new floip()
  floipObj.server = server
  if(authHeader) {
    floipObj.authHeader = authHeader
  }
  floipObj.convertFromServer()
} else {
  console.log('Cant do anything');
}
