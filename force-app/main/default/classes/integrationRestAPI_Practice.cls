@RestResource(urlMapping='/createAccountRecord')
Global class integrationRestAPI_Practice {
    
    
    //data support bulkification with custome post api
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
    
    global Class accountWrapper{
        
        public String name;
        public String rating;
        public String type;
    }
    
    

}