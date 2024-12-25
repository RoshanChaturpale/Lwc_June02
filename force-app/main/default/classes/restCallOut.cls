Public class restCallOut{
    
    //restApiIntergration
    //wrapperBody
    
    /*
public class restCallout {
    
    @future(callout=true)
    public static void makeCallout(Set<Id> accountIds) {
        // Query accounts
        List<Account> accounts = [SELECT Id, Name, Rating FROM Account WHERE Id IN :accountIds];
        
        // Query related contacts
        List<Contact> contacts = [SELECT FirstName, LastName, AccountId FROM Contact WHERE AccountId IN :accountIds];
        
         list<ApexWrapperJSONBody> wrapList = new List<ApexWrapperJSONBody>();

        // Loop through accounts
        for (Account acc : accounts) {
            ApexWrapperJSONBody wrap = new ApexWrapperJSONBody();
            wrap.accountName = acc.Name;
            wrap.accountRating = acc.Rating;

            // Find the first related contact for the current account
            for (Contact con : contacts) {
                if (con.AccountId == acc.Id) {
                    wrap.contactFirstName = con.FirstName;
                    wrap.contactLastName = con.LastName;
                    break; // Break the loop once a matching contact is found
                }
            }
            
            wrapList.add(wrap);
            
            }

            // Serialize the wrapper object to JSON
            String jsonBody = JSON.serialize(wrapList);
            System.debug('jsonBody: ' + jsonBody);

            // Make HTTP POST callout
            Http htp = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint('callout:SalesforceOrgAccesss/services/apexrest/CompanyData');
            req.setMethod('POST');
            req.setHeader('Content-Type', 'application/json');
            req.setBody(jsonBody);

            HttpResponse res = htp.send(req);
            System.debug('Response Status: ' + res.getStatus());
            System.debug('Response Body: ' + res.getBody());
        
    }
}
*/
//===============================================================================================    
 
    /*
    public class ApexWrapperJSONBody {

    
    public string accountName;
    public string accountRating;
    
    public string contactFirstName;
    public string contactLastName;

}
    
*/
    
    
//================================================
    
/*
  public class accountTriggerHandller {
    
    public static void method1(List<Account> acclist){
        
        set<id> setids = new set<id>();
        For(Account acc : acclist){
            setids.add(acc.id);
        }
        system.debug('setids ===> ' +setids);
        
         // Pass Account IDs to the Future Method
        restCallout.makeCallout(setids);
            
    }

}
 
 */
    
/////=========================================================
//
/*trigger accountTrigger on Account (before insert, After insert, After Update) {
    
    
    if(trigger.isInsert && trigger.isAfter){
        accountTriggerHandller.method1(trigger.new);
    }
    else if(trigger.isUpdate && trigger.isAfter){
        accountTriggerHandller.method1(trigger.new);
        
    }

}

*/

    
}