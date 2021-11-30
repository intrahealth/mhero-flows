### Synchronizing Contacts to FHIR Practitioners

mHero has a method called syncContacts which is scheduled to run and synchronize contacts between Rapidpro and mHero. mHero does below steps to achieve this:

* Pulls all FHIR Practitioners.
* Pulls all Rapidpro contacts.
* Loop through each FHIR Practitioner and create a Rapidpro add contact request that includes a field specifying the entity type I.e Practitioner, Patient e.t.c and entity ID which is the FHIR Practitioner ID, and then makes a post request to rapidpro to create a Practitioner as a contact in Rapidpro. The respective Rapidpro contact uuid is also added to the corresponding FHIR Practitioner as an Identifier with system being “http://app.rapidpro.io/contact-uuid” and the value being the contact uuid and then a Practitioner get updated as well.
* mHero also checks if two way synchronization is enabled, if it is enabled then it loops through all the rapidpro contacts to see any contact that is in rapidpro and missing in mHero,  if it finds any then it converts that Rapidpro contact to a FHIR Practitioner with the Rapidpro contact uuid being added as an identifier to the FHIR Practitioner then a Practitioner is saved into FHIR server. The respective FHIR Practitioner ID and entity types are also added back to the corresponding Rapidpro contact as fields and the Rapidpro gets updated with these changes on the contact.
