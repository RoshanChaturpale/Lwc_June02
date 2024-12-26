@RestResource(urlMapping='/contacts')
global with sharing class ContactAPI {

    // GET Method - Retrieve Contacts Without Wrapper
    @HttpGet
    global static String getContacts() {
        try {
            // Query the Contact object and retrieve necessary fields
            List<Contact> contacts = [SELECT Id, FirstName, LastName, Email, Phone FROM Contact LIMIT 10];
            
            List<ContactWrapper> wrapper = new List<ContactWrapper>();
            
            For(Contact con : contacts){
                ContactWrapper wr = new ContactWrapper();
                wr.conFirstName = con.FirstName;
                wr.conLastname = con.LastName;
                wr.conEmail = con.Email;
                wrapper.add(wr);
                
              
            }
            
            string Jsn = JSON.serialize(wrapper);
            
            system.debug('json is ====> ' +jsn);

            // Serialize the Contact list directly into JSON format
            return JSON.serialize(Jsn);
        } catch (Exception e) {
            // Handle any errors and return a user-friendly message
            return 'Error: ' + e.getMessage();
        }
    }
}