public with sharing class adminPortalDetailPageClass {
    
    @AuraEnabled(cacheable=true)
    public static Account getAccount(Id userId) {
        try {
            Account acc = [SELECT Id, Name, Industry, AnnualRevenue 
                           FROM Account 
                           WHERE OwnerId = :userId 
                           LIMIT 1];
            return acc;
        } catch (Exception e) {
            throw new AuraHandledException('No account found for this user.');
        }
    }
}