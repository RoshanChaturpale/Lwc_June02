@RestResource(urlMapping='/CompanyData')
Global class restApiIntergration {
    
    
    Global static List<Account> getAccountRecord(){
        
            //RestRequest req = RestContext.request;
   // RestResponse res = RestContext.response;
        
        List<Account> acclist = [select id, Name, Rating from Account];
        
        string jsonBody = JSON.serialize(acclist);
        
      system.debug('jsonBody============>' +jsonBody.toString());

        
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
            
            /*
            // Create Contact objects for each contact associated with the Account
                for (ContactDetails contact : wrp.contacts) {
                    Contact con = new Contact();
                    con.FirstName = contact.firstName;
                    con.LastName = contact.lastName;
                    con.AccountId = insertedAccount.Id; // Link the Contact to the Account
                    contactList.add(con);
                }
            */
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
    
    
public static void createWrapperBody(){
        
        
        List<Account> acccountList = [select id, Name,(select id, FirstName, LastName, Email from Contacts) from Account];
        
        system.debug('acccountList' +acccountList);
        
        List<wrappData> wraperlist = new List<wrappData>();
        
        For(Account acc : acccountList){
            wrappData wr = new wrappData();
            wr.accountName = acc.Name;
            
            List<contactData>  contactlist = new List<contactData>();
            
            For(Contact con : acc.Contacts){
                contactData cd = new contactData();
                cd.firstname = con.FirstName;
                cd.lastname = con.LastName;
                cd.email = con.Email;
                contactlist.add(cd);
                
            }
            
            wr.contacts = contactlist;
            
            wraperlist.add(wr);
        }
        
        string JsonBody = JSON.serialize(wraperlist);
        
        system.debug('JsonBody ===> ' +JsonBody);
        
        
        
        
        
    }
    
    public class wrappData{
        
        public string accountName;
        public List<contactData> contacts;
        
    }
    
    Public class contactData{
        
      public  string firstName;
        public string lastName;
        public string email;
        
    }
    
    



    

}