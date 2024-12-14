@RestResource(urlMapping='/myapi')
Global with sharing class MyfirstRESTAPI {
    
    @HttpGet
    Global static String featchAccount(){
        
        restRequest request = restContext.request;
        restResponse response = restContext.response;
        
        Map<string,Object> mapparam = request.params; //is property it give us Map
       
       
       
       system.debug('mapparam' +mapparam);
        //url Parameters
        //urI
        //Body
        //Headers
        
        
        
        List<Account> accountList = [select id, Name from Account];
        
        string jsonString  = JSON.Serialize(accountList);
        
        return jsonString;
    }

}