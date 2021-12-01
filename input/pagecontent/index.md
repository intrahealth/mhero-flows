### mHero Flows Library and FHIR Interoperability (mhero-flows)

<br/><br/>
<img src="mherlogo.png" class="center" width="200">
<br/><br/>

This Implementation Guide (IG) demonstrates a prototypical framework for working with mHero and it's FHIR backend and short messages in FLOIP or RapidPro format.

The tooling is meant to provide a basis to understand the reference tooling and how to test their own profiled mHero workflows. In this draft status, this tooling does not contain conformance resources. It only contains documentation and tooling.

Comments are welcome. Please submit a [GitHub Issue](https://github.com/intrahealth/mhero-flows/issues/new/choose).

### Introduction

[mHero](https://www.mhero.org) is a two-way, mobile phone-based communication system that connects ministries of health and health workers. It uses data from existing local health information systems to deliver messages via locally popular communication channels. It reduces the barriers that can exist between health workers and their support systems, playing a critical role in ensuring effective and efficient responses, particularly in a crisis.

Health officials can use mHero to:
* **Communicate** both routine and urgent messages to health workers. 
* **Target messages** to health workers based on cadre, location, or skill set. 
* **Collect critical information** that powers resilient health systems, including stock levels, routine and one-time assessments, and validation of health worker and facility data.
* **Build capacity** and **provide support** to health workers, to give them the information, skills, and encouragement to deliver quality health services.
 
**mHero is not a new technology.** Instead, it is a new way to connect data from existing technologies to allow for targeted, real-time communication. It does so by using global interoperability standards for health information exchange. In other words, mHero can help platforms speak in a common language and easily share data.

[IntraHealth International](https://www.intrahealth.org) and [UNICEF](https://www.unicef.org) created mHero in August 2014 to support health-sector communication during the Ebola outbreak in Liberia. The original version of mHero connected Liberia's health workforce information system, [iHRIS](https://www.ihris.org), with [RapidPro](https://app.rapidpro.io), a platform that delivers basic text and audio messages. The use of RapidPro made it possible to reach most Liberian frontline health workers using only basic mobile phones.

Since the end of the Ebola crisis, the Ministry of Health and Social Welfare in Liberia has integrated the platform into its health information system infrastructure to meet ongoing communication needs for various health services. Several other countries have also tested or deployed mHero, including for COVID-19 response purposes.

The technology behind mHero has also evolved since the initial deployment in Liberia. Both advancements in technology, as well as varying conditions and needs in other countries, inspired IntraHealth to make mHero more interoperable. It can operate with other communication platforms and any health information systems compliant with the global Fast Healthcare Interoperability Resources (FHIR) standards.

mHero’s origin and ongoing use and development illustrate how the platform is **flexible**, **scalable**, and **sustainable** by governments in low- and middle-income countries.