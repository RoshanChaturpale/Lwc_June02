public with sharing class apexClass_practice_LWC {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactlist() {
        return [SELECT Id, FirstName, LastName FROM Contact LIMIT 5];
    }
}