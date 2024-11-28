public with sharing class apexClass_practice_LWC {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactlist() {
        return [SELECT Id, FirstName, LastName FROM Contact LIMIT 5];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Cricketers__c> getCricketerList() {
        
        List<Cricketers__c> cricketList = [Select id, Name,Age__c,Images__c,Runs__c, Image_Url__c, Nationality__c from Cricketers__c];
        
        return cricketList;
        
        
    }
    
    
}