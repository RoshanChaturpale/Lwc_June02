public class AccountTriggerHandler {
    
    Public static void method1(List<Account> newaccountList , List<Account> oldaccountList){
        
        System.debug('oldaccountList values is == ' + oldaccountList);
        System.debug('before update operation');
        
        Map<id,Account> accMap = New Map<id, Account>();
        For(Account acc : newaccountList){
            accMap.Put(acc.id, acc);    
        }
        
        For(id i : accMap.keySet()){
            system.debug('accMap is ===- ' +accMap.get(i));
        }
        
    }
    
    
    Public static void practiceBeforeInsertMethod(List<Account> newAccList){
        
        
        System.debug('newAccList ' +newAccList);
        system.debug('newAccList size is == ' +newAccList.size());
        
        Set<id> setids = new Set<id>();
        For(Account acc : newAccList){
            setids.add(acc.id);
        }
        
        system.debug('setids is ==  ' +setids);
    }
    
    Public static void beforeInsertUpdate(List<Account> acclist){
        
        For(Account acc : acclist){
            
            if(acc.Industry == 'Media' || acc.Industry == 'Energy'){
                acc.Rating = 'Hot';
               // acc.Description = 'Date is ==' + system.today();
            }
            
            
            if(string.isBlank(acc.Account_Email__c)){
                acc.Account_Email__c.addError('Without Account_Email__c address, you cannot create Account record.');
                
            }
            
            if(string.isBlank(acc.Account_Phone__c)){
                acc.Account_Phone__c.addError('Without Account_Phone__c address, you cannot create Account record.');
                
            }
        }
        
    }
    
    Public static void createRelatedContact(List<Account> acclist){
     
        
        List<Contact> contactList = new List<Contact>();
        For(Account acc : acclist){
            
            Contact con = new Contact();
            con.AccountId  = acc.id;
            con.FirstName = acc.Name;
            con.LastName = con.FirstName;
            contactList.add(con);
        }
        
        If(!contactList.isEmpty()){
            Insert contactList;
        }
        
    }
    
    
/* Trigger Scenario:- Create related Opportunity when Account is created   */
    
    Public static void createRelatedOpportunity(List<Account> acclist){
        
        
        List<Opportunity> opportunityList = new List<Opportunity>();
        For(Account acc : acclist){
            
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.id;
            opp.Name = acc.Name;
            opp.CloseDate = system.today();
            opp.StageName = 'Prospecting';
            opportunityList.add(opp);
        }
        
        
    }
    
    
    
     /* Trigger Scenario:- 1. On Account two checkbox fields are available
                             New Contact and New Opportunity.
                        
                          2. On Account Creation
                            * If New Contact checkbox is checked then a related Contact should be Created.
                            * If New Opportunity checkbox is checked and Active=Yes, then a Related Opportunity should be Created. */

    Public static void createRelatedConOppwithCheckBox(List<Account> acclist){


        List<Contact> contactlist = new List<Contact>();
        List<Opportunity> opportunityList = new List<Opportunity>();
        
        For(Account acc : acclist){
            
            if(acc.CreateContctWithThisCheckBox__c == true){
                
                Contact con = new Contact();
                con.AccountId = acc.id;
                con.LastName = acc.Name;
                contactlist.add(con);
                
            }
            
            if(acc.CreateOpportunityWithThisCheckBox__c == true){
                
                Opportunity opp = new Opportunity();
                opp.AccountId = acc.id;
                opp.Name = acc.Name;
                opp.StageName = 'Prospecting';
                opp.CloseDate = system.today();
                opportunityList.add(opp);
                
            }
        }        
        
        If(!contactlist.isEmpty()){
            insert contactlist;
        }
        
        
        If(!opportunityList.isEmpty()){
            Insert opportunityList;
        }
        
        
        
    }
    
    
    /* Duplicate Email On Account    */ 
    
    Public static void validationWithDuplicateEmail(List<Account> acclist){
        
        
        
        Set<String> emailString = new Set<String>();
        For(Account acc : acclist){
            emailString.add(acc.Account_Email__c);
        }
       // system.debug('emailString is ==' +emailString);
       
        List<Account> accountList = [select id, Account_Email__c from Account where Account_Email__c IN : emailString];
        
        
        For(Account acc : acclist){
            if(acc.Account_Email__c != null){
                For(Account a : accountList){
                    if(a.Account_Email__c == acc.Account_Email__c && a.id != acc.id){
                        
                        acc.Account_Email__c.addError('Duplicate Email is Found..');
                    }
                }
            }
        }        
    }
    
  /* Duplicate Phone On Account    */    
    
    Public static void validationWithDuplicatePhone(List<Account> acclist){
        
        
        set<string> phoneString = new set<string>();
        For(Account acc : acclist){
            phoneString.add(acc.Account_Phone__c);
        }
        
        List<Account> accountList = [select id, Account_Phone__c from Account Where Account_Phone__c IN : phoneString];
        
        For(Account acc : acclist){
            if(acc.Account_Phone__c != null){
                For(Account a : accountList){
                    if(a.Account_Phone__c == acc.Account_Phone__c && a.id != acc.id){
                        acc.Account_Phone__c.addError(' Duplicate Phone Number is Found! ');
                    }
                }
            }
        }
        
    }
    
    
  
/* When Account Phone is Updated then Populate Account's Phone Number on all Contacts in HomePhone field:
    * Write Code using parent-child SOQL               
    * Implement trigger and triggerHandller
    * Also write test class for code coverage   */ 
    
    Public static void updateRelatedContactsWithSOQL(List<Account> acclist, Map<id, Account> accOldMap){
        
        List<Contact> contactList = new List<Contact>();
        set<id> setids = new set<id>();
        For(Account acc : acclist){
            setids.add(acc.id);
        }
        system.debug('setids is === ' +setids);
        
        List<Account> accountList = new List<Account>();
        accountList = [select id, Phone,(select id,Phone from Contacts) from Account where id IN : setids];
        
        For(Account a : accountList){
            if(a.Contacts != null){
                For(Contact con : a.Contacts){
                    con.Phone = a.Phone;
                    con.HomePhone = accOldMap.get(a.id).Phone;
                    
                    contactList.add(con);
                }
            }
        }
        if(contactList.size() > 0){
            update contactList;
        }
        
    }
    
 /*Prevent account from deleting, if it has 2 or more contacts */
    
    Public static void deleteContacts(List<Account> accOld){
        
        Set<id> setids = new Set<id>();
        For(Account acc : accOld){
            if(acc.id != null){
                setids.add(acc.Id);
            }
        }
        system.debug('setids olds is is ===' +setids);
        
        List<Account> accountList = [select id, (select id, Accountid from Contacts) from Account where id IN : setids];
        
        For(Account a : accountList){
       
            if(a.Contacts.size() >= 2){
                a.addError('account cannot be deleted with Related Contacts...');
            }
            
        }
        
    }
    
    

        
     public static void deleteRelatedOpportunities(List<Account> deletedAccounts) {
        
         Set<Id> accountIds = new Set<Id>();
        for (Account acc : deletedAccounts) {
            accountIds.add(acc.Id);
        }
        
        List<Opportunity> opportunitiesToDelete = [SELECT Id FROM Opportunity WHERE AccountId IN :accountIds AND (StageName != 'Closed Won' AND StageName != 'Closed Lost')];
        
        if (!opportunitiesToDelete.isEmpty()) {
            delete opportunitiesToDelete;
        }
    }
        
        
        
   
    
    

}