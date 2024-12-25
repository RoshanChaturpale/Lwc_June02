Global class AccountCallOut {
    
    Global Static Void sendAccounts(List<Account> accountJSON){
        
        string requestBody = JSON.serialize(accountJSON);
        
        string targetEndPoint = '';
        
        httpRequest req = new httpRequest();
        
        
    }
    
    

}