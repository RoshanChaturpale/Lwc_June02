public class ContactTriggerHandller {
    
    
/* Validation on Contact */
    Public static void cantdeleteContact(list<Contact> conlist){
         For(Contact con : conlist){
            if(con.check_this_box_you_can_t_delete_contact__c == true){
                con.check_this_box_you_can_t_delete_contact__c.addError('cant delete this contact record');
            }
            if(con.Contact_Amount__c >= 50000 && con.Contact_Amount__c <= 60000){
                con.Contact_Amount__c.addError('Can\'t delete Contact');
            }
        }
      }
    
/* Validation on Phone and email */    
public static void validateEmailAndPhone(List<Contact> newContacts) {
        for (Contact con : newContacts) {
            if (String.isBlank(con.Email)) {
                con.Email.addError('Without Email address, you cannot create Contact record.');
            }
            if (String.isBlank(con.Phone)) {
                con.Phone.addError('Without Phone, you cannot create Contact record.');
            }
        }
    }

/* Duplicate Email and Phone on Contact */    
public static void preventDuplicateContactEmailAndPhone(List<Contact> newContacts) {
        
        Set<String> emailSet = new Set<String>();
        Set<String> phoneSet = new Set<String>();

        for(Contact con : newContacts) {
            if(con.Email != null) {
                emailSet.add(con.Email);
            }
            if(con.Phone != null) {
                phoneSet.add(con.Phone);
            }
        }

        if (emailSet.isEmpty() && phoneSet.isEmpty()) {
            return;
        }

        List<Contact> existingContacts = [SELECT Id, Email, Phone FROM Contact WHERE Email IN :emailSet OR Phone IN :phoneSet];

        for (Contact con : newContacts) {
            if (con.Email != null) {
                for (Contact existingCon : existingContacts) {
                    if (existingCon.Email == con.Email && existingCon.Id != con.Id) {
                        con.Email.addError('Duplicate Email is Found');
                    }
                }
            }

            if (con.Phone != null) {
                for (Contact existingCon : existingContacts) {
                    if (existingCon.Phone == con.Phone && existingCon.Id != con.Id) {
                        con.Phone.addError('Duplicate Phone is Found');
                    }
                }
            }
        }
    }    
/* Account-Billing To Contact-Mailling with List , Set Collection*/  
    Public static void setMailingCountryFromAccount(List<Contact> conlist){
        
        set<id> setids = new set<id>();
        For(Contact con : conlist){
            if(con.AccountId != Null){
                setids.add(con.AccountId);
            }
        }
        if(!setids.isEmpty()){
            List<Account> accounts = [select id, BillingCity, BillingCountry from Account Where Id In : setids];
            For(Contact contacts : conlist){
                if(contacts.MailingCountry == null && contacts.AccountId != null){
                    for(Account acc : accounts){
                        if(acc.id == contacts.AccountId){
                            contacts.MailingCountry = acc.BillingCountry;
                            contacts.MailingCity = acc.BillingCity;
                            break;
                        }
                    }
                }
            }
        }
    }

/* Account-Billing To Contact-Mailling with Map Collection*/    
 public static void AccountBillingToContactMailling(List<Contact> contacts) {
        
        Set<Id> accountIds = new Set<Id>();
        for (Contact contact : contacts) {
            accountIds.add(contact.AccountId);
        }
        
        
        Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, BillingCountry FROM Account WHERE Id IN :accountIds]);
        
       
        for (Contact contact : contacts) {
            if (String.isBlank(contact.MailingCountry) && accountMap.containsKey(contact.AccountId)) {
                contact.MailingCountry = accountMap.get(contact.AccountId).BillingCountry;
            }
        }
    } 
    
/* Count Contacts On Account */
Public static void CountContacts(List<Contact> conlist){
        
        List<Account> updateAccount = new List<Account>();
        set<id> setids = new Set<id>();
        For(Contact con : conlist){
          setids.add(con.AccountId);
        }
        
        list<Account> accountlist = [select id,Total_Contact_Count__c, (select id From Contacts) From Account where id IN : setids];
        
        For(Account acc : accountlist){
            
            Account a = new Account();
            a.id = acc.id;
            a.Total_Contact_Count__c = acc.Contacts.size();
            updateAccount.add(a);
        }
        
        if(!updateAccount.isEmpty()){
            update updateAccount;
        }
        
    }
    
    
    //Set Primary Contact On Account
    Public static void Method1(List<Contact> conlist){
        
        set<id> setids = new set<id>();
        For(Contact con : conlist){
            setids.add(con.Accountid);
        }
        
        List<Account> account = [select id,Primary_Contact__c,(select id,Primary_Contact__c from Contacts) from Account where id IN : setids];
        
        For(Account acc : account){
            If(acc.Contacts != null){
                 for(Contact con : acc.Contacts){
                if(con.Primary_Contact__c == True){
                    acc.Primary_Contact__c = 'Primary Contact';
                }
                
            }
                
            }
           
            
        }
        Update account;

    }
 
   
    
  
    
    
    
    
}