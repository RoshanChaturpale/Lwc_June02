public with sharing class ContactControllerr {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [SELECT Id, Name, Email FROM Contact LIMIT 100];
    }
    
    @AuraEnabled
    public static void createContact(Contact contact) {
        insert contact;
    }
    
    @AuraEnabled
    public static void updateContact(Contact contact) {
        update contact;
    }
    
    @AuraEnabled
    public static void deleteContact(Id contactId) {
        delete [SELECT Id FROM Contact WHERE Id = :contactId];
    }
}