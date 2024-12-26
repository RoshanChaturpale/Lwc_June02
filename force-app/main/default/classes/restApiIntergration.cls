@RestResource(urlMapping='/CompanyData')
Global class restApiIntergration {
    
    @HttpGet
    Global static List<Account> getAccountRecord(){
        
        List<Account> acclist = [select id, Name, Rating from Account  limit 10];
        
       return acclist;
        
        
        
    }
   

@HttpPost
global static void createAccount() {
    RestRequest req = RestContext.request;
    RestResponse res = RestContext.response;

    // Get the request body
    String requestBody = req.requestBody.toString();
    System.debug('Request Body: ' + requestBody);

    try {
        // Deserialize JSON into the wrapper class
        List<wrapperBody> wrappers = (List<wrapperBody>) JSON.deserialize(requestBody, List<wrapperBody>.class);
        System.debug('Deserialized Data: ' + wrappers);

        // Lists for bulk insert
        List<Account> accountList = new List<Account>();
        List<Contact> contactList = new List<Contact>();

        // Step 1: Create Account objects
        for (wrapperBody wrp : wrappers) {
            Account acc = new Account();
            acc.Name = wrp.accountName;
            acc.Rating = wrp.accountRating;
            accountList.add(acc);
        }

        // Insert accounts in bulk
        if (!accountList.isEmpty()) {
            insert accountList;
        }

        // Step 2: Create Contact objects linked to the inserted Accounts
        for (Integer i = 0; i < wrappers.size(); i++) {
            wrapperBody wrp = wrappers[i];
            Account insertedAccount = accountList[i]; // Get the corresponding inserted Account

            Contact con = new Contact();
            con.FirstName = wrp.contactFirstName;
            con.LastName = wrp.contactLastName;
            con.AccountId = insertedAccount.Id; // Link the Contact to the Account
            contactList.add(con);
        }

        // Insert contacts in bulk
        if (!contactList.isEmpty()) {
            insert contactList;
        }

        // Send success response
        res.statusCode = 201; // Created
        res.responseBody = Blob.valueOf('Records created successfully.');
    } 
    catch (Exception ex) {
        System.debug('Error: ' + ex.getMessage());
        res.statusCode = 500; // Internal Server Error
        res.responseBody = Blob.valueOf('An error occurred: ' + ex.getMessage());
    }
}

    

}