Alias: $launchContext = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext
Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Instance: demographics
InstanceOf: Questionnaire
Usage: #example
* url = "http://hl7.org/fhir/uv/sdc/Questionnaire/demographics"
* version = "2.8.0"
* name = "DemographicExample"
* title = "Questionnaire - Demographics Example"
* status = #draft
* subjectType = #Patient
* date = "2021-10-26T00:03:21+00:00"
* publisher = "HL7 International - FHIR Infrastructure Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://hl7.org/Special/committees/fiwg"
* description = "A sample questionnaire using context-based population and extraction"
* jurisdiction = $m49.htm#001

* extension[0].extension[0].url = "name"
* extension[=].extension[=].valueCoding = $launchContext#patient
* extension[=].extension[+].url = "type"
* extension[=].extension[=].valueCode = #Patient
* extension[=].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
* extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* extension[=].valueExpression.language = #application/x-fhir-query
* extension[=].valueExpression.expression = "Patient?_id={{%patient.id}}"

* item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].extension[=].valueBoolean = true
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].extension[=].valueExpression.expression = "%patient.id"
* item[=].linkId = "patient.id"
* item[=].definition = "Patient.id"
* item[=].text = "(internal use)"
* item[=].type = #string
* item[=].readOnly = true

* item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].extension.valueExpression.language = #text/fhirpath
* item[=].extension.valueExpression.expression = "%patient.birthDate"
* item[=].linkId = "patient.birthDate"
* item[=].definition = "Patient.birthDate"
* item[=].text = "Date of birth"
* item[=].type = #date
* item[=].required = true

* item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].extension.valueExpression.name = "patientName"
* item[=].extension.valueExpression.language = #text/fhirpath
* item[=].extension.valueExpression.expression = "%patient.name"
* item[=].linkId = "patient.name"
* item[=].definition = "Patient.name"
* item[=].text = "Name(s)"
* item[=].type = #group
* item[=].repeats = true
* item[=].item[0].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension.valueExpression.language = #text/fhirpath
* item[=].item[=].extension.valueExpression.expression = "%patientName.family"
* item[=].item[=].linkId = "patient.name.family"
* item[=].item[=].definition = "Patient.name.family"
* item[=].item[=].text = "Family name"
* item[=].item[=].type = #string
* item[=].item[=].required = true
* item[=].item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension.valueExpression.language = #text/fhirpath
* item[=].item[=].extension.valueExpression.expression = "%patientName.given"
* item[=].item[=].linkId = "patient.name.given"
* item[=].item[=].definition = "Patient.name.given"
* item[=].item[=].text = "Given name(s)"
* item[=].item[=].type = #string
* item[=].item[=].required = true
* item[=].item[=].repeats = true

* item[+].extension[0].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].extension[=].valueExpression.name = "relative"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "RelatedPerson?patient={{%patient.id}}"
* item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemExtractionContext"
* item[=].extension[=].valueExpression.language = #application/x-fhir-query
* item[=].extension[=].valueExpression.expression = "RelatedPerson?patient={{%patient.id}}"
* item[=].linkId = "relative"
* item[=].text = "Relatives, caregivers and other personal relationships"
* item[=].type = #group
* item[=].repeats = true
* item[=].item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-hidden"
* item[=].item[=].extension[=].valueBoolean = true
* item[=].item[=].extension[+].url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension[=].valueExpression.language = #text/fhirpath
* item[=].item[=].extension[=].valueExpression.expression = "%relative.id"
* item[=].item[=].linkId = "relative.id"
* item[=].item[=].definition = "RelatedPerson.id"
* item[=].item[=].text = "(internal use)"
* item[=].item[=].type = #string
* item[=].item[=].readOnly = true
* item[=].item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].extension.valueExpression.language = #text/fhirpath
* item[=].item[=].extension.valueExpression.expression = "%relative.relationship"
* item[=].item[=].linkId = "relative.relationship"
* item[=].item[=].definition = "RelatedPerson.relationship"
* item[=].item[=].text = "Name(s)"
* item[=].item[=].type = #choice
* item[=].item[=].required = true
* item[=].item[=].repeats = true
* item[=].item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype"
* item[=].item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
* item[=].item[=].extension.valueExpression.name = "relativeName"
* item[=].item[=].extension.valueExpression.language = #text/fhirpath
* item[=].item[=].extension.valueExpression.expression = "%relative.name"
* item[=].item[=].linkId = "relative.name"
* item[=].item[=].definition = "RelatedPerson.name"
* item[=].item[=].text = "Name(s)"
* item[=].item[=].type = #group
* item[=].item[=].repeats = true
* item[=].item[=].item[0].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension.valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].extension.valueExpression.expression = "%relativeName.family"
* item[=].item[=].item[=].linkId = "relative.name.family"
* item[=].item[=].item[=].definition = "RelatedPerson.name.family"
* item[=].item[=].item[=].text = "Family name"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].required = true
* item[=].item[=].item[+].extension.url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
* item[=].item[=].item[=].extension.valueExpression.language = #text/fhirpath
* item[=].item[=].item[=].extension.valueExpression.expression = "%relativeName.given"
* item[=].item[=].item[=].linkId = "relative.name.given"
* item[=].item[=].item[=].definition = "RelatedPerson.name.given"
* item[=].item[=].item[=].text = "Given name(s)"
* item[=].item[=].item[=].type = #string
* item[=].item[=].item[=].required = true
* item[=].item[=].item[=].repeats = true