public with sharing class apexClass_practice_LWC {
    
    @AuraEnabled(Cacheable = true)
    public static list<Account> getAccountData(String textkey) {
        textkey = '%' + textkey + '%';
        list<Account> accLst = [SELECT  Id, Name, Industry, Phone, Type From Account WHERE Name LIKE :textkey];
        
        if(accLst.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return accLst; 
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactlist() {
        return [SELECT Id, FirstName, LastName FROM Contact LIMIT 5];
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Cricketers__c> getCricketerList(String nationality) {
        
        system.debug('nationality : ' + nationality);
        
        if(nationality == ''){
              return  [Select id, Name,Age__c,Images__c,Runs__c, Image_Url__c, Nationality__c from Cricketers__c];
        }else{
            
             return [Select id, Name,Age__c,Images__c,Runs__c, Image_Url__c, Nationality__c from Cricketers__c where Nationality__c =: nationality];           
        }       
    
   }
    
    
}