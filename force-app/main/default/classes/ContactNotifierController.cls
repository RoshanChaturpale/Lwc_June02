public with sharing class ContactNotifierController {
    @AuraEnabled(cacheable=true)
    public static Contact getRecentlyAddedContact(Id accountId, Id userId) {
        List<Contact> contacts = [SELECT Id, Name, CreatedById 
                                  FROM Contact 
                                  WHERE AccountId = :accountId 
                                  AND CreatedById != :userId 
                                  ORDER BY CreatedDate DESC 
                                  LIMIT 1];
        if (!contacts.isEmpty()) {
            return contacts[0];
        }
        return null;
    }
}