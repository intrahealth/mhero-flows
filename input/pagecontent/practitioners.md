### How Contact Synchronization Works

Currently, mHero syncs contacts as FHIR Practitioners. The sync can be one-way -- meaning from mHero to RapidPro or two-way between both systems.

mHero has a method called syncContacts which is scheduled to run and synchronize contacts between Rapidpro and mHero. mHero does below steps to achieve this:

* Pulls all FHIR Practitioners.
* Pulls all Rapidpro contacts.
* Loops through each FHIR Practitioner and: 
    * creates a RapidPro add contact request that includes a field specifying the entity type ie. Practitioner, Patient etc and entity ID which is the FHIR Practitioner ID, and then makes a POST request to RapidPro to create a Practitioner as a contact in RapidPro. The respective RapidPro contact UUID is also added to the corresponding FHIR Practitioner as an Identifier with system being “http://app.rapidpro.io/contact-uuid” and the value being the contact UUID and then a Practitioner gets updated as well.
* mHero also checks if two way synchronization is enabled, if it is enabled then it loops through all the RapidPro contacts to see any contact that is in RapidPro and missing in mHero. 
    * If it finds any then it converts that RapidPro contact to a FHIR Practitioner with the RapidPro contact uuid being added as an identifier to the FHIR Practitioner then a Practitioner is saved into FHIR server. The respective FHIR Practitioner ID and entity types are also added back to the corresponding RapidPro contact as fields and the Rapidpro gets updated with these changes on the contact.
