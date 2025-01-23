public with sharing class carController {
    
    @AuraEnabled(cacheable=true)
    Public static List<Car__c> getCar(){
        
        List<Car__c> getCarList = [select id, Name from Car__c];
        
        return getCarList;
        
    }

}