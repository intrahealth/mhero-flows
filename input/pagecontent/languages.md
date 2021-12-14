### Flows in Multiple Languages

There are multiple opportunities and challenges with proceeding with short messaging flows to FHIR workflows outside of a singular language. There are different approaches depending on whether the implementer will use one dominant language, or is in context in which there must be multiple languages simultaneously supported. For the most comprehensive overview, see this [talk](https://www.youtube.com/watch?v=F44uXBvIb0Y) by Rene Spronk.

> **Note**: FHIR IDs (resource.id) are limited to [ASCII](https://www.hl7.org/fhir/datatypes.html#primitive). But, identifiers, code systems, and other key values are usable in Unicode.

Per the [specification](https://build.fhir.org/languages.html), there are several approaches that may be used, specifically:

* Language tag on Resource and Narrative
* Translation Extension
* Translations on CodeSystem and ValueSet
* Translatable extension on element definition
* Language Tags on HTTP requests
* Languages in Names and Addresses

What this means is that implementers must approach their multiple language needs differently.

### Flows and FHIR Questionnaires

For starting with FHIR Questionnaires as the primary source of the survey structure and text, there are experiments ongoing to use .PO or XLIFF files to hold translations and render Questionnaire resources with the translations. See [this discussion on the FHIR chat](https://chat.fhir.org/#narrow/stream/179255-questionnaire/topic/multi-language.20questionnaires) for more about implementation methods.
