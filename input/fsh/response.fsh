Alias: $targetStructureMap = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-targetStructureMap

Instance: Example-QuestionnaireResponse
InstanceOf: QuestionnaireResponse
Usage: #example
* status = #in-progress
* questionnaire = "http://hl7.org/fhir/uv/sdc/Questionnaire/demographics"
* item[0].linkId = "patient.id"
* item[=].text = "(internal use)"
* item[+].linkId = "patient.birthDate"
* item[=].text = "Date of birth"
* item[=].answer.valueDate = "1935-01-08"
* item[+].linkId = "patient.name"
* item[=].text = "Name(s)"
* item[=].item[0].linkId = "patient.name.family"
* item[=].item[=].text = "Family name"
* item[=].item[=].answer.valueString = "Presley"
* item[=].item[+].linkId = "patient.name.given"
* item[=].item[=].text = "Given name(s)"
* item[=].item[=].answer.valueString = "Elvis"

* item[+].linkId = "relative"
* item[=].text = "Relatives, caregivers and other personal relationships"
* item[=].item[0].linkId = "relative.id"
* item[=].item[=].text = "(internal use)"
* item[=].item[+].linkId = "relative.relationship"
* item[=].item[=].text = "Name(s)"
* item[=].item[+].linkId = "relative.name"
* item[=].item[=].text = "Name(s)"
* item[=].item[=].item[0].linkId = "relative.name.family"
* item[=].item[=].item[=].text = "Family name"
* item[=].item[=].item[=].answer.valueString = "Presley"
* item[=].item[=].item[+].linkId = "relative.name.given"
* item[=].item[=].item[=].text = "Given name(s)"
* item[=].item[=].item[=].answer.valueString = "Priscilla"
