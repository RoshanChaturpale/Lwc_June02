@RestResource(urlMapping='/AccountRecord')
Global class integrationRestAPI_Practice {
    
    
    @HttpGet
    Global Static accountContactCaseData_Get getAccountData(){
        
        map<string, string> param = RestContext.Request.params;
        
        //string par = param.get('industry');
        //List<String> industries = par.split(',');   //multiple values

        String accountId = param.get('accountId');
        
        set<id> setids = new set<id>();
        List<Account> accountlist = [select id, Name, Phone, Industry from Account where id   =: accountId];
        
        For(Account acc : accountlist){
            setids.add(acc.id);
        }
        
        List<Contact> contactlist = [select id, AccountId , FirstName, LastName from Contact where AccountId =: setids];
        List<Case> getcaselist = [select id , Subject from Case where AccountId =: setids];
        
        accountContactCaseData_Get getWrapper  = new accountContactCaseData_Get();
        getWrapper.acclist = accountlist;
        getWrapper.conlist = contactlist;
        getWrapper.caselist = getcaseList;
      
        return getWrapper;
    }
    
   /* @httpPost
    Global static String createAccount(string accname ,string accrating){
            
        Account acc = new Account();
        acc.Name = accname;
        acc.Rating = accrating;
        
        insert acc;
        return 'account data created successfully';
    }*/
    
    @httpPost
    Global static string createAccountContactData(accountInformation information){
 
        Account accrecord = information.accountRecords;
        Contact conrecord = information.contactRecords;
        
        try{
            insert accrecord;
            conrecord.AccountId = accrecord.Id;
            insert conrecord;
            return 'account and contact is created successfully...';
                }catch(exception e){
                    
                    return e.getMessage();     
                }     
    }
    
   
    
    
    
   
    /*data support bulkification with custome post api
     @HttpPost
    global static void sendAccountRecordWithBulkification(){
        
        restRequest request = restContext.request;
        restResponse response = restContext.response;
        
        List<Account> accountList = new List<Account>();
        List<accountWrapper> accWrapper = (List<accountWrapper>) JSON.deserialize(request.requestBody.toString(), List<accountWrapper>.class);
        
        
        
        if(accWrapper != null && accWrapper.size() > 0){
            For(accountWrapper accObj : accWrapper){
                Account acc = new Account();
                acc.Name = accObj.name;
                acc.Rating = accObj.rating;
                acc.Type = accObj.type;
                accountList.add(acc);
            }
            
            if(accWrapper != null && accWrapper.size() > 0){
                Insert accountList;
            }
            
            // Initialize the JSON response as an array of records
            String responseJson = '[';
            
            for (Account acc : accountList) {
                
                // Append each account record in a proper JSON format
                 responseJson += '{"recordId": "' + acc.Id + '", "Status": "Success"},';
            }
            
            // Remove the last comma and close the JSON array
               responseJson = responseJson.removeEnd(',');
               responseJson += ']';

// Set the response body and status code
response.responseBody = Blob.valueOf(responseJson);
response.statusCode = 200;


        }
    
    }
*/

    //single data support
   /* @HttpPost
    global static void sendAccountRecord(){
        
        restRequest request = restContext.request;
        restResponse response = restContext.response;
        
        accountWrapper accWrapper = (accountWrapper) JSON.deserialize(request.requestBody.toString(), accountWrapper.class);
        
        if(accWrapper != null){
            Account acc = new Account();
            acc.Name = accWrapper.name;
            acc.Rating = accWrapper.rating;
            acc.Type = accWrapper.type;
            
            if(acc != null){
                Insert acc;
            }
        }
    
    }*/
    
    
    
    Global class accountInformation{
        
        global Account accountRecords{get;set;}
            global Contact contactRecords{get;set;}
   
    }  
    
    
    global Class accountWrapper{
        
        public String name;
        public String rating;
        public String type;
    }
    
    
    
    
    global class accountContactCaseData_Get{
        
        list<Account> acclist;
        list<Contact> conlist;
        list<Case> caselist;
    }
    
    

}