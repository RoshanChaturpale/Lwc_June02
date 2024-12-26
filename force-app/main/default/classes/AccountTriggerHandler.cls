public class AccountTriggerHandler {
    
    Public static void Practice(List<Account> acclist){
        
        set<id> setids = new set<id>();
        list<String> Sname = New List<String>();
        system.debug('acc size is == ' +acclist.size());
        For(Account acc : acclist){
          setids.add(acc.id);
          Sname.add(acc.Name);
        }
        system.debug('acc id is === ' +setids);
        system.debug('acc name is == ' +Sname);
        
    }
    
/* Before insert && Update Actions */    
Public static void BeforeUpdate(List<Account> acclist){
        
        For(Account acc : acclist){
            
            if(acc.Industry == 'Media'  || acc.Industry == 'Energy'){
                acc.Rating = 'Hot'; 
            } 
            
            
            
            if(acc.CopyBillingToShipping__c == true){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet = acc.BillingStreet;
            }
            
            
            if(!acc.Name.contains('Mr.') && !acc.Name.contains('Ms.')){
                if (acc.Gender__c == 'Male') {
                   acc.Name = 'Mr. ' + acc.Name;
                } 
                else if(acc.Gender__c == 'Female') {
                    acc.Name = 'Ms. ' + acc.Name;
               }
            }
        }
    } 
    
    
/*  Trigger Scenario:- Create related Contact when Account is created */    
Public static void AccountToContact (List<Account> acclist){
        
        List<Contact> conlist =  new List<Contact>();
        
        For(Account acc : acclist){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            conlist.add(con);
        }
        if(!conlist.isEmpty()){
            insert conlist;
        }
}    
    
/* Trigger Scenario:- Create related Opportunity when Account is created   */
Public static void CreateRelatedOpportunity(List<Account> acclist){
        
        List<Opportunity> opplist = New List<Opportunity>();
        For(Account acc : acclist){
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name = acc.Name;
            opp.CloseDate = system.today();
            opp.StageName = 'Prospecting';
            opplist.add(opp);
        }
        
        if(!opplist.isEmpty()){
            insert opplist;
        }
    }
    
    
/* Trigger Scenario:- 1. On Account two checkbox fields are available
                             New Contact and New Opportunity.
                        
                          2. On Account Creation
                            * If New Contact checkbox is checked then a related Contact should be Created.
                            * If New Opportunity checkbox is checked and Active=Yes, then a Related Opportunity should be Created. */
    
public static void CreateContactOrOpportunityWithCheckBox(List<Account> acclist){
    
    list<Contact> contactList = new list<Contact>();
    List<Opportunity> OpportunityList = New List<Opportunity>();
    
    For(Account acc : acclist){
        
        if(acc.CreateContctWithThisCheckBox__c == true){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            contactList.add(con);
            
        }
        
        if(acc.CreateOpportunityWithThisCheckBox__c == true && acc.Active__c == 'Yes'){
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.Id;
            opp.Name = acc.Name;
            opp.CloseDate = system.today();
            opp.StageName = 'Prospecting';
            OpportunityList.add(opp);
        }
    }
    
    if(!contactList.isEmpty()){
        INSERT contactList;
    }
    if(!OpportunityList.isEmpty()){
        INSERT OpportunityList;
    }
        
        
    }
    
/* Before Delete Actions  */
Public static void CantDeleteAccountwithCheckBox(List<Account> acclist){
        
        For(Account acc : acclist){
            if(acc.check_this_box_you_can_t_delete_contact__c == true){
                acc.addError('You Cant Delete this Account Record becoz "check this box you cant delete contact" is true so you delete this Account Record Unchecked and Delete the Record');
            }
            
            if(acc.AnnualRevenue >= 50000){
                acc.addError('You Cannot delete Account with Annual-Revenue Greater than 50000');
            }
                
            }
        }
    
    
/* Valiation on Account Email & Phone */    
public static void ValidationBeforeInsert(list<Account> acclist){
        
        For(Account acc : acclist){
            if(String.isBlank(acc.Account_Email__c)){
                acc.Account_Email__c.AddError('Without Email address, you cannot create Account record.');
        }
            if(String.isBlank(acc.Account_Phone__c)){
                acc.Account_Phone__c.AddError('Without Phone , you cannot create Account record.');
            }
    }
}
    
/* Duplicate Email On Account    */    
Public static void DuplicateEmail(List<Account> acclist){
        
        set<String> emailString = new set<String>();
        For(Account acc : acclist){
            emailString.add(acc.Account_Email__c);
        }
        
        List<Account> accountlist = new List<Account>();
        accountlist =[select id , Account_Email__c FROM Account where Account_Email__c IN : emailString];
        
        For(Account acc : acclist){
            if(acc.Account_Email__c != Null){
                For(Account aa : accountlist){
                    if(aa.Account_Email__c == acc.Account_Email__c && aa.Id != acc.id){
                        acc.Account_Email__c.addError('duplicate Email is Found');
                        
                    }
                }
            }
        }
    }
    

/* Duplicate Phone On Account    */
    Public static void DuplicatePhone(List<Account> acclist){
        
        set<String> stringPhone = new Set<String>();
        For(Account acc : acclist){
            stringPhone.add(acc.Account_Phone__c);
        }
        
        List<Account> accountlist = new List<Account>();
        accountlist = [select id, Account_Phone__c from Account where Account_Phone__c IN : stringPhone];
        
        For(Account acc : acclist){
            if(acc.Account_Phone__c != Null){
                For(Account aaa : accountlist){
                    if(aaa.Account_Phone__c == acc.Account_Phone__c && aaa.id != acc.Id){
                        acc.Account_Phone__c.addError('Duplicate Phone Number is found');
                    }
                }
            }
        }
    }

    
/* Duplicate Email && Phone On Account    */
public static void preventDuplicateAccountEmailAndPhone(List<Account> newAccounts) {
        Set<String> emailSet = new Set<String>();
        Set<String> phoneSet = new Set<String>();
        
        for (Account acc : newAccounts) {
            if (acc.Account_Email__c != null) {
                emailSet.add(acc.Account_Email__c);
            }
            if (acc.Account_Phone__c != null) {
                phoneSet.add(acc.Account_Phone__c);
            }
        }
        
        if (emailSet.isEmpty() && phoneSet.isEmpty()) {
            return;
        }
        
        List<Account> existingAccounts = [SELECT Id, Account_Email__c, Account_Phone__c  FROM Account WHERE Account_Email__c IN :emailSet OR Account_Phone__c IN :phoneSet];
        
        for (Account acc : newAccounts) {
            if (acc.Account_Email__c != null) {
                for (Account existingAcc : existingAccounts) {
                    if (existingAcc.Account_Email__c == acc.Account_Email__c && existingAcc.Id != acc.Id) {
                        acc.Account_Email__c.addError('Duplicate Email is Found');
                    }
                }
            }
            
            if (acc.Account_Phone__c != null) {
                for (Account existingAcc : existingAccounts) {
                    if (existingAcc.Account_Phone__c == acc.Account_Phone__c && existingAcc.Id != acc.Id) {
                        acc.Account_Phone__c.addError('Duplicate Phone is Found');
                    }
                }
            }
        }
    }
    

    

    
/* Copy Account Phone  to all Related Phone Contacts */    
Public static void CopyPhoneAccToContact(List<Account> acclist){
        
        
        list<Contact> conlist = new List<Contact>();
        set<id> setids = new set<id>();
        For(Account acc : acclist){
            setids.add(acc.id);
        }
        
        List<Account> accountlist = [select id, Phone,(select id,Phone From Contacts ) from Account where id IN : setids];
        
        for(Account a : accountlist){
            for(Contact Con : a.Contacts){
                Con.Phone = a.Phone;
                conlist.add(con);
            }
        }
        if(!conlist.isEmpty()){
            update conlist;
        }
}
    
/* When Account Phone is Updated then Populate Account's Phone Number on all Contacts in HomePhone field:
    * Write Code using parent-child SOQL               
    * Implement trigger and triggerHandller
    * Also write test class for code coverage   */    
Public static void UpdateRelatedContactsWithSOQL(List<Account> acclist, Map<id,Account> AccOldMap){
        
        
        List<Contact> ContactList = new List<Contact>();
        
        Set<id> setid = new Set<id>();
        For(Account acc : acclist){
            setid.add(acc.Id);
        }
        
        List<Account> AccountList = New List<Account>();
        AccountList = [Select id, Phone, (Select id, Phone From Contacts) From Account Where Id IN : setid];
        
        For(Account a : AccountList){
            if(a.Contacts != Null){
                For(Contact con : a.Contacts){
                    con.Phone = a.Phone;
                    con.HomePhone = AccOldMap.get(a.id).Phone;
                    ContactList.add(con);
                }
            }
        }
    
        if(ContactList.size() > 0){
        UPDATE ContactList;
        }
} 
    
/* Update Related - Contacts with Phone Numbers when Account Phone is Updated With Map Collection  */   
Public static void updateRelatedContactsWithMap(List<Account> acclist, Map<id, Account> accOldMap){
        
        
        Map<id, Account> accMap = new Map<id, Account>();
        
        For(Account acc : acclist){
            if(accOldMap.get(acc.Id).Phone != acc.Phone){
                accMap.put(acc.id, acc);
            }
            
        }
        
        List<Contact> conList = [Select id, AccountId, Phone From Contact where AccountId In : accMap.keySet()];
        List<Contact> contactList = new List<Contact>();
        
        if(!conList.isEmpty()){
            For(Contact con : conList){
                con.Phone  = accMap.get(con.AccountId).Phone;
                contactList.add(con);
            }
        }
        
        if(!contactList.isEmpty()){
            Update contactList;
        }
        
        
    }
      
    
    

    
    
/* Trigger Scenario:- Whenever account is created with industry as banking then create a contact for account,
                     contact lastname as account name and contact phone as account phone    */
Public static void CreateContactwithIndustryisBaking(List<Account> acclist){
 
        List<Contact> contactlist = New List<Contact>();
        For(Account acc : acclist){
            if(acc.Industry == 'Banking'){
                Contact con = New Contact();
                con.AccountId = acc.Id;
                con.LastName = acc.Name;
                contactlist.add(Con);
            }
        }
        if(!Contactlist.isEmpty()){
            insert contactlist;
        }
}    
    
/* Delete all contacts related account when account gets deleted via apex trigger  */   
public static void deleteContacts(List<Account> accounts) {
        
       Set<Id> accountIds = new Set<Id>();
        for (Account account : accounts) {
            accountIds.add(account.Id);
        }
    List<Contact> contactsToDelete = [SELECT Id FROM Contact WHERE AccountId IN :accountIds];
    delete contactsToDelete;
}
 
    
    
/* Phone OldValue && NewValue in Descripton  */
Public static void OldandNew(List<Account> acclist, map<id, Account> oldvalue){
    
    For(Account acc : acclist){
        acc.Description = 'New value is '  + acc.Phone + ' Old value is ' + oldvalue.get(acc.id).phone;
    }
}
    

/*   */    
Public static void CreateContactsWithNumber(List<Account> acclist){
    
    List<Contact> contactlist = new List<Contact>();
    For(Account acc : acclist){
        For(integer i=1; i<=acc.Number_Of_Contacts__c; i++){
            
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            contactlist.add(con);
                
            }
        }
        if(!contactlist.isEmpty()){
            Insert contactlist;
        }
}
    
    /*    
 public static void Method1(List<Account> acclist){
        
        List<Contact> contactList = new List<Contact>();
        
        for(Account acc : acclist){            
            for(integer i=1; i<=acc.Number_Of_Contacts__c; i++){                
                 Contact con= new Contact();
                 con.AccountId =acc.id;
                 con.LastName = acc.Name;
                contactList.add(con);
            }
         }
        insert contactList;
}
        
    
   
public static void Method2(List<Account> acclist){
     set<id> ids = new set<id>();
     for(Account a : acclist) {
         ids.add(a.id);
     }  
     
   list<Account> accounts = [select id,Name,(select id,LastName from Contacts) from Account where id IN : ids];
 	system.debug('accounts : '+accounts);
        List<Contact> delContacts = new List<Contact>();
       // List<Account> accounts = [select id ,Number_Of_Contacts__c, from Account];
        
        for(Account acc : [select id,Number_Of_Contacts__c,(select id,LastName from Contacts) from Account where id IN : ids]){
            Integer i=0;
            Integer delSize = Integer.valueOf(acc.Contacts.size()-acc.Number_Of_Contacts__c);
          //  system.debug('delSize : '+delSize);            
            for(Contact con : acc.Contacts){
                system.debug('con : '+con);
                	system.debug(i);
                if(i<delSize)	{
                    delContacts.add(con);
                }
                i=i+1;
               // system.debug(i);
            }
         }
     if(delContacts.size()>0){
         delete delContacts;
     }
}
   
*/
    

/*Public static void PreventDeletionRelatedRecords(List<Account> acclist){
        
        set<id> setids = new set<id>();
        For(Account acc : acclist){
            setids.add(acc.id);
        }
        
        list<Account> accountlist = [select id, Name,(select id, Name from Contacts) From Account where Id IN : setids];
         
          Map<id,Account> mapacc = new Map<id,Account>(); 
    
          for(Account a:accountlist){
           mapacc.put(a.id,a);
           }   
    
    
            for(Account acc : accountlist){
               if(mapacc.get(acc.id).Contacts.size()>=2)
				{
				acc.adderror('account cannot be deleted');
				}
                }
}  */
    
    
  /*  An Account record creation if Industry picklist value is in the Energy or Engineering Industry must have at  least one related Contacts.  */
    
    Public static void HandleBeforeInsertUpdate(List<Account> newAccounts, Map<id, Account> oldAccounts){
        
        set<String> validIndustries = new Set<String>{'Energy', 'Engineering'};
         List<Account> accountsToValidate = new List<Account>();
        For(Account account : newAccounts){
            if(validIndustries.contains(account.Industry)){
                accountsToValidate.add(account);
                
            }
        }
        
        
        if(accountsToValidate.size() > 0){
            List<Contact> relatedContacts = [select id, AccountId from Contact where AccountId IN : accountsToValidate];
            map<id , Integer> accountContactsCounts = new map<id, Integer>();
            
            For(Contact contact : relatedContacts){
                if(accountContactsCounts.containsKey(contact.AccountId)){
                    accountContactsCounts.Put(contact.AccountId, accountContactsCounts.get(contact.AccountId) + 1);
                        }else{
                            accountContactsCounts.put(contact.AccountId, 1);
                        }
            }
            For(Account account : accountsToValidate){
                if(!accountContactsCounts.containsKey(account.id) || accountContactsCounts.get(account.Id) ==0){
                    account.addError('An Account in the Energy or Engineering Industry must have at  least one related Contacts.');
                    
                }
            }
            
        }
        
    }   
    Public static void onBeforeInsert(List<Account> newAccounts){
        HandleBeforeInsertUpdate(newAccounts, null);
    }
     Public static void onBeforeUpdate(List<Account> newAccounts, Map<id,Account> oldAccounts){
        HandleBeforeInsertUpdate(newAccounts, oldAccounts);
    }
    
  /* write a trigger with salesforce with helper and hanller class if the industry is engineering in industry 
     picklist if any related contact is available delete this contact */  
     
     Public static void IfIndustryisEnginnering(List<Account> acclist){
        
        set<id> setids = new Set<id>();
        For(Account acc : acclist){
            if(acc.Industry == 'Engineering'){
                setids.add(acc.id);
            } 
        }
        
        List<Contact> contactlist = [select id from Contact where AccountId IN : setids];
        
        if (!contactlist.isEmpty()) {
                delete contactlist;
            }
    }
    
    /* When we update an Account Type is Prospect so delete related Opportunitities whose (StageName != 'Closed Won' AND StageName != 'Closed Lost')  */
    Public static void deleteRelatedOpportunity(List<Account> acclist){
        
        Set<id> setids = new Set<id>();
           For(Account acc : acclist){
               if(acc.Type == 'Prospect'){
                    Setids.add(acc.id); 
               }
              
           }
        system.debug('setids is ====>>>>'  +setids);
        
        List<Opportunity> opportunityList = [select id, Name From Opportunity Where AccountId IN : setids and (StageName != 'Closed Won' AND StageName != 'Closed Lost')];
        
        
        if (!opportunityList.isEmpty()) {
            delete opportunityList;
        }
        
    }
  
 /* generate salesforce trigger with  if  create industry picklist field value with energy 
    so if that that case related contact record is mandatory  */
    
    public static void handleAccounts(List<Account> accounts) {
        
        
        Set<String> energyIndustryAccountIds = new Set<String>();
        
        for (Account acc : accounts) {
            if (acc.Industry == 'Energy') {
                energyIndustryAccountIds.add(acc.Id);
            }
        }
        
        Map<String, Contact> relatedContacts = new Map<String, Contact>();
        
        for (Contact con : [SELECT Id, AccountId FROM Contact WHERE AccountId IN :energyIndustryAccountIds]) {
            relatedContacts.put(con.AccountId, con);
        }
        
        for (Account acc : accounts) {
            if (acc.Industry == 'Energy' && !relatedContacts.containsKey(acc.Id)) {
                acc.addError('A related contact is required for accounts with the industry set to "Energy"');
            }
        }
    }
    
   /* generate salesforce trigger with  if  create industry picklist field value with energy 
    so if that that case two(2) related contact record is mandatory  */  
 public static void handleAccounts1(List<Account> accounts) {
        Set<String> energyIndustryAccountIds = new Set<String>();
        
        for (Account acc : accounts) {
            if (acc.Industry == 'Energy') {
                energyIndustryAccountIds.add(acc.Id);
            }
        }
        
        Map<String, List<Contact>> accountToContactsMap = new Map<String, List<Contact>>();
        
        for (Contact con : [SELECT Id, AccountId FROM Contact WHERE AccountId IN :energyIndustryAccountIds]) {
            if (!accountToContactsMap.containsKey(con.AccountId)) {
                accountToContactsMap.put(con.AccountId, new List<Contact>());
            }
            accountToContactsMap.get(con.AccountId).add(con);
        }
        
        for (Account acc : accounts) {
            if (acc.Industry == 'Energy') {
                if (!accountToContactsMap.containsKey(acc.Id) || accountToContactsMap.get(acc.Id).size() < 2) {
                    acc.addError('At least two-(2) related contacts are required for accounts with the industry set to "Energy"');
                }
            }
        }
    }
    
    
    
        
 /*  
      
  trigger AccountTrigger_01 on Account(After update){
    map<id,Account> accMap = new map<id,Account>();
    For(Account objAcc : trigger.new){
        if(objAcc.type != trigger.oldMap.get(objAcc.id).type){
            accMap.put(objAcc.id, objAcc);
        }
    }
    
    list<Contact> conList = new list<contact>();
    
    for(Contact objCon : [Select Id, AccountId, Leadsource, level__c From Contact Where AccountId IN : accMap.Keyset()]){
        conList.add(objCOn);
    }
    
    For(Contact objCon : conList){
        if(accMap.containskey(objCon.AccountId)){
            if(accMap.get(objCon.AccountId).type == 'Technology Partner'){
                objCon.leadSource = 'Web';
                objCon.level__c = 'Primary';
            }
            else{
                objCon.leadSource = '';
                objCon.level__c = '';
            }
        }
    }
    if(!conlist.isEmpty()){
        database.update(conList,false);
    }
}



*/
    
    Public static void afterUpdate(List<Account> acclist, Map<id, Account> oldAccMap){
        
         map<id,Account> accMap = new map<id,Account>();
    For(Account objAcc : acclist){
        if(objAcc.type != oldAccMap.get(objAcc.id).type){
            accMap.put(objAcc.id, objAcc);
        }
    }
    
    list<Contact> conList = new list<Contact>();
    
    for(Contact objCon : [Select Id, AccountId, Leadsource, level__c From Contact Where AccountId IN : accMap.Keyset()]){
        conList.add(objCOn);
    }
    
    For(Contact objCon : conList){
        if(accMap.containskey(objCon.AccountId)){
            if(accMap.get(objCon.AccountId).type == 'Technology Partner'){
                objCon.leadSource = 'Web';
                objCon.level__c = 'Primary';
            }
            else{
                objCon.leadSource = '';
                objCon.level__c = '';
            }
        }
    }
    if(!conlist.isEmpty()){
        database.update(conList,false);
    }
        
        
    }
    
    
    /* Duplicate Name on Account is Found so give validation 'Duplicate Name is Found'  */
    
    Public static void duplicateName(List<Account> acclist){
        
        Set<String> sName = new Set<String>();
        For(Account acc : acclist){
            
            sName.add(acc.Name);
        }
        
        List<Account> accountList = [select id ,Name from Account where Name IN : sName];
        
        For(Account a : accountList ){
            
            For(Account aa : acclist){
                IF(a.id != aa.id && aa.Name == a.Name){
                    
                    aa.Name.addError('Duplicate Name is found...');
                }else{
                    
                   
                }
                
            }
        }
        
        
        
        
    }
    
    
 /* Create an Opportunity when we insert an account. And if same name opportunity is exist then send error like
   " Oppornitity with same name is exist"  */ 
    
    public static void method1(List<Account> accList) {
        Set<String> accName = new Set<String>();
        for (Account acc : accList) {
            accName.add(acc.Name);
        }

       
        List<Opportunity> oppList = [SELECT Id, Name from Opportunity where Name IN : accName];

        Map<String, Opportunity> oppMap = new Map<String, Opportunity>();
        for (Opportunity opp : oppList) {
            oppMap.put(opp.Name, opp);
        }

        List<Opportunity> insertOpp = new List<Opportunity>();
        for (Account acc : accList) {
            if (oppMap.containsKey(acc.Name)) {
                acc.addError('Opportunity with same name already exists');
            } else {
                Opportunity o = new Opportunity();
                    o.Name = acc.Name;
                    o.AccountId = acc.Id;
                    o.StageName = 'Prospecting';
                    o.CloseDate = System.Today();
                   insertOpp.add(o);
            }
        }

        
            insert insertOpp;
       
    }
    
    /* Duplicate Email and Phone is Found so before insert error is found ---- Note :- This code not working properly */
    Public static void duplicateEmailAndPhonePrevention(List<Account> acclist){
        
        set<String> emailString = new set<String>();
        set<String> phoneString = new set<String>();
        
        For(Account acc : acclist){
            emailString.add(acc.Account_Email__c);
            phoneString.add(acc.Account_Phone__c);
        }
        
        list<Account> accountList = [Select Id, Name, Account_Email__c, Account_Phone__c From Account Where Account_Email__c IN : emailString AND Account_Phone__c IN : phoneString];

        For(Account a : accountList){
              if(accountList.size() > 0){
               a.addError('Duplicate Email and phone is not allowed during creating an account');
        }
    }
    }
    
    
    Public static void updateAccountStatus(list<Account> acclist){
        
      //  system.debug('acclist is ==> ' +acclist);
        
        List<Account> aa = new List<Account>();
        Set<id> setids = new Set<id>();
        //set<String> sName = new Set<String>();
        For(Account acc : acclist){
            setids.add(acc.id);
           // sName.add(acc.name);
        }
       // system.debug('setids is ===>' +setids);
       // system.debug('sName is ===>' +sName);
        
        List<Account> accountList = [select id, Status__c From Account where id IN : setids];
        
        For(Account a : accountList){
            if(a.Status__c == 'InActive'){
                a.Status__c = 'Active';
                aa.add(a);
            }
        }
        Update aa;
        
    }
    
 /* if Account Ownership picklist field is update with Public so populate Related Contacts with Description called 'Account Ownership is ===> Public' */
    Public static void updateContactDescriptionWithAccountOwnership(List<Account> acclist){
       
        List<Contact> conList = new List<Contact>();
        set<id> setids = new set<id>();
        For(Account acc : acclist){
            if(acc.id != null && acc.Ownership == 'Public'){
                setids.add(acc.id);
            }
        }
        
        List<Account> accountList = [select id, Ownership, (select id, AccountId, Description From Contacts) From Account where Id IN : setids];
        
        For(Account a : accountList){
            For(Contact con : a.Contacts){
                con.Description = 'Account Ownership is ===> ' + a.Ownership;
                conList.add(con);
            }
        }
        
        if(!conList.isEmpty()){
            Update conList;
        }
        
    }
    
    //simple debug use to check the value and size
    Public static void beforeInserHandller(list<Account> acclist){
        
        system.debug('acclist size is ====> ' +acclist.size());
       system.debug('acclist is ===> ' +acclist);
    }
   
    /* if user update Account industry value then related contact description should be pupulated with new value and old account industry value  */
    Public static void updateRelatedContactDescription(List<Account> acclist, Map<id, Account> oldAccMap){
        
        List<Contact> conList = new List<Contact>();
        Set<id> setids =  new Set<id>();
        For(Account acc : acclist){
            if(acc.Industry != null){
                setids.add(acc.id);
            }
        }
      
        
        List<Account> accountList = [select id, Industry,(select id, AccountId, Description from Contacts) from Account where id In : setids];
        
        For(Account a : accountList){
            if(a.id != null){
                For(Contact con : a.Contacts){
                    con.Description = 'Account new Industry Value is == ' + a.Industry + ' && Account Old Industry value is == ' + oldAccMap.get(a.id).Industry;
                    conList.add(con);  
                }
                
            }
        }
        if(!conList.isEmpty()){
            UPDATE conList;
        }
    }
  
    
  Public static void methodName(list<Account> acclist){
        
        set<id> setids = new Set<id>();
        For(Account acc : acclist){
            setids.add(acc.id);
        }
        list<Opportunity> opplist = [SELECT Id, StageName FROM Opportunity WHERE StageName != 'Closed Won' AND StageName != 'Closed Lost' AND AccountId IN :setids];
        
        if(!opplist.isEmpty()) {
            delete opplist;
        }    
    }
    
    

  
    /*this is depend on person account if duplicate person account is there then merge this new  account with existing same */
   public static void mergeDuplicateAccounts(List<Account> newList) {
      
            List<String> recordTypeNames = new List<String>{'LMS UAT', 'Cash Canada', 'Fast Easy Money', 'LottoLend' , 'Person Account'};
            List<Account> accList = new List<Account>();
            List<Id> accIds = new List<Id>();
            if (!newList.isEmpty()) {
                for (Account accObj : newList) {
                    accIds.add(accObj.Id);
                }
                system.debug('accIds is == ' +accIds);
            }
            
            if(accIds != null && !accIds.isEmpty()){
                accList = [select id, FirstName, LastName, PersonEmail, /*Attempt_Merging_Person_Account__c */ Phone, RecordTypeId from account where IsPersonAccount = true AND Id IN: accIds];
            }
            
            if (!accList.isEmpty()) {
                for (Account accObj : accList) {
                    List<Account> customerDetails = [
                        SELECT Id, FirstName, LastName, PersonEmail, /*Attempt_Merging_Person_Account__c*/ Phone
                        FROM Account
                        WHERE IsPersonAccount = true
                        AND RecordTypeId = :accObj.RecordTypeId 
                        AND RecordType.Name IN: recordTypeNames
                        //AND Attempt_Merging_Person_Account__c = true
                        AND FirstName = :accObj.FirstName
                        AND LastName = :accObj.LastName
                        AND PersonEmail = :accObj.PersonEmail
                    ];
                    
                    system.debug('customerDetails === ' +customerDetails);
                    
                    if (!customerDetails.isEmpty()) {
                        for (Account mergeAccObj : customerDetails) {
                            Database.merge(accObj, mergeAccObj, false);
                        }
                    }
                }
            }
        
    }
    
    

    
    
    
    
}