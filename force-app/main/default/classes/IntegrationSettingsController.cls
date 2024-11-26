public with sharing class IntegrationSettingsController {
    @AuraEnabled(cacheable=true)
    public static List<Integration_Setting__c> getIntegrationSettings_01() {
        return [SELECT Name, API_Token__c, Endpoint__c, Username__c, Password__c, Method__c 
                FROM Integration_Setting__c 
                WHERE CRM_Customer__c IN ('Inverite', 'Flinks', 'PandaDoc')];
    }
    
    
    @AuraEnabled(cacheable=true)
    public static List<Integration_Setting__c> getIntegrationSettings() {
        return [SELECT Name, API_Token__c, Endpoint__c, Username__c, Method__c,CRM_Customer__c FROM Integration_Setting__c];
    }
    
    


   @AuraEnabled
    public static String saveIntegrationSettings(String apiName, String endpoint, String token, String username, String password, String crmcustomer, String method) {
        try {
            Integration_Setting__c integrationSetting = new Integration_Setting__c();
           
            integrationSetting.API_Token__c = apiName;
            integrationSetting.Endpoint__c = endpoint;
            integrationSetting.Username__c = username;
            integrationSetting.Password__c = password;
            integrationSetting.CRM_Customer__c = crmcustomer;
            integrationSetting.Method__c = method;
            
            insert integrationSetting;
            return 'Success';
        } catch (Exception e) {
            return 'Error: ' + e.getMessage();
        }
    }
}