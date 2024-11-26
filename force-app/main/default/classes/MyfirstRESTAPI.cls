@RestResource(urlMapping='/myapi')
Global with sharing class MyfirstRESTAPI {
    
    @HttpGet
    Global static String featchAccount(){
        
        List<Account> accountList = [select id, Name from Account];
        
        string jsonString  = JSON.Serialize(accountList);
        
        return jsonString;
    }

}