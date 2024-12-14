@RestResource(urlMapping='/AccountContactApi')
Global class integrationRestAPI_Practice_01 {
    
    @HttpPost
    Global static void method(){
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String Body = req.requestBody.toString();
        
        system.debug('Body is ==> ' +Body);
        
        RestApiClass restClass = (RestApiClass) JSON.deserialize(Body , RestApiClass.Class);
        
        system.debug('restClass Customer Name is ==> ' + restClass.customerName);
        system.debug('restClass value is ===> ' + restClass.isAccount);
        
        if(restClass.isAccount == true){
            Account acc = new Account();
            acc.Name = restClass.customerName;
            insert acc;
        }else if(restClass.isAccount == false){
            Contact con = new Contact();
            con.LastName = restClass.customerName;
            insert con;
        }

        
    }

}