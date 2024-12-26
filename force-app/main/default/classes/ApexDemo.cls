public class ApexDemo {
    
/*1. Query 5 Account records into a list. Now iterate on a list and create a set of account
Ids and display values of the set.*/
Public static void ApexDemo1(){
    

    set<id> setids =new set<id>();    
    List<Account> acclist = new List<Account>();
    acclist = [select id, Name from Account limit 5];
    
    For(Account acc : acclist){
        setids.add(acc.id);
    }
    
    For(id i : setids){
        system.debug('Account id is===:' + i);
    }
        
    }
    
/*2. Query 5 Account records into a list. Now iterate on a list and create a map where key
will be account Id and value will be Account sObject (using loop) and display values of
map.*/
    Public static void ApexDemo2(){
        
        Map<id, Account> accMap = new Map<id,Account>();
        List<Account> acclist = new List<Account>();
        acclist= [select id from Account limit 5];
        
        For(Account acc : acclist){
            accMap.put(acc.id,acc);
        }
        
        For(id i : accMap.keySet()){
            system.debug('accmap key set' + accMap.get(i));
        }
        
        
    }
/*3. Query 5 Account records into a list. Now create a map where key will be account Id and
value will Account sObject (without using loop) and display values of map.*/

Public static void ApexDemo03(){
        
      List<Account> acclist = new List<Account>();
      acclist =[select id from Account limit 5];
    
     Map<id,Account> accMap = New Map<id,Account>(acclist);
    
    for(id i : accMap.keySet()){
        system.debug('accMap is==:' + accMap.get(i));
    }
}
    
/*4. Query 5 Account records into a list. Now create a set of Account ID and Map <Id,
Account> using a list. Now iterate on set and check whether set values match with map
key, if yes then display map value.*/
    
    Public static void ApexDemo4(){
        
        List<Account> acclist = New List<Account>();
        set<id> setids = New set<id>();
        acclist = [select id from Account limit 5];
        
        Map<id,Account> accMap = New Map<id,Account>();
        
        For(Account acc : acclist){
            accMap.put(acc.id,acc);
        }
        
        For(Account acc : acclist){
            setids.add(acc.id);
        }
        
        For(id i : setids){
            if(setids.contains(i)){
                system.debug('accMap is ===: ' + accMap.get(i));
            }
        }
        
        
        
    }
    

/*5. Query This/Last Week created Accounts with related contacts*/
    Public static void ApexDemo5(){
        
        List<Account> acclist = New List<Account>();
        acclist = [select id, Name,(select id, FirstName, LastName from Contacts) From Account where CreatedDate = Last_Week];
        
        For(Account acc : acclist){
            system.debug('Account Name is==:' +acc.Name);
            system.debug('Total related Contacts==:' + acc.Contacts.Size());
            for(Contact con : acc.Contacts){
                system.debug('Contact FirstName is==:' + con.LastName);
            }
            
        }
    } 
    
    
/*6. Query This/Last Week created contacts with related account Name and Phone.*/
    
    Public static void ApexDemo6(){
        
        List<Contact> conlist = New List<Contact>();
        conlist = [select id ,Name, Account.Name, Account.Phone from Contact WHERE CreatedDate = Last_week];
         
        For(Contact con : conlist){
            system.debug('Contact Name is==:' +con.Name + ', Account Name is==:' + con.Account.Name + ', Phone Number is===:' + con.Account.Phone);
        }
    } 
 
/*7. Query Account (Id, Name, Phone) with Related Opportunities (Name, CloseDate, Stage)
      where Account Phone != null. Sort the records in both Asc or Desc Order based on
      CreatedDate.  */
    
    Public static void ApexDemo7(){
        
        List<Account> acclist = New List<Account>();
        acclist = [select id, Name, Phone,(select Name, CloseDate, StageName from Opportunities) from Account Where Phone != Null ORDER By CreatedDate asc];
        
        For(Account acc : acclist){
            system.debug('Account Name is===:' +acc.Name);
            
            For(Opportunity opp : acc.Opportunities){
                system.debug('Opp Name is===:' + opp.Name + ', Opp Stage Name is===:' +opp.StageName);
                
            }
        }
    }
/*8. Query Account along with related contacts where Account phone!=null. Now display
results through system.debug( ) in following ways: Account Name has #ofcontacts
related.  */
    Public static void ApexDemo8(){
    
        List<Account> acclist = New List<Account>();
        acclist = [select id, Name,Phone,(Select id,Name from Contacts) from Account where Phone != Null];
        
        For(Account acc : acclist){
            system.debug('Account Name is===:' + acc.Name + ', Number of Contacts is===:' + acc.contacts.size());
            
        }
    }
 /*9. Query Account along with related opportunities where Account phone!=null. Now
display results through system.debug( ) in following ways:
“Account Name has TotalAmountOnRelatedOpp worth Opportunities”. */
    
    Public static void ApexDemo9(){
        
        List<Account> acclist = new List<Account>();
        acclist = [select id, Name,(select Name,Amount from Opportunities) from Account where Phone != Null];
        
        For(Account acc : acclist){
            Decimal TotalAmount =0;
            For(Opportunity opp : acc.Opportunities){
                if(opp.Amount != Null){
                     TotalAmount = TotalAmount + opp.Amount;
                }
               
            }
            system.debug('Account Name is===:' + acc.Name + ', Total Opportunities' + acc.Opportunities.size() + ', Total Amount is===:' + TotalAmount);
        }
        
        
    }
 /*10. Create 2 Account records with two separate insert statements. Then create 2 Account
records with a single insert statement using List  */
    
    Public static void ApexDemo10(){
        
        Account acc1 = New Account();
        acc1.Name = 'ABC';
        insert acc1;
        
        Account acc2 = New Account();
        acc2.Name = 'BBC';
        insert acc2;
    }
 /*Version 2: Accounts with single insert statements: [Use this as part of Best Practice.] */
   
    Public static void ApexDemo10_1(){
        
        List<Account> acclist = New List<Account>();
        Account acc1 = New Account();
        acc1.Name = 'ABC1';
        acclist.add(acc1);
        
        Account acc2 = New Account();
        acc2.Name = 'BBC1';
        acclist.add(acc2);
        
         if(!acclist.isEmpty()){
        insert acclist;
    }
    }
/*11. Insert 5 Accounts with different account Names and Phone =’123456’. [Hint: Loop]*/   

    Public static void ApexDemo11(){
        
        List<Account> acclist = New List<Account>();
        For(integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'Roshan' +i;
            acc.Phone = '123456789'+i;
            acclist.add(acc);
            system.debug('count is' +acclist.Size());
        }
        if(!acclist.isEmpty()){
            Insert acclist;
        }
        
    }
    
/* 12. Insert 5 Opportunities with different Opportunity Names, CloseDate = Today’s Date
and Stage = ‘ Prospecting. [Hint: Loop]*/
    
    Public static void ApexDemo12(){
        
        List<Opportunity> opplist = New List<Opportunity>();
        For(Integer i=1; i<=5; i++){
            Opportunity opp = New Opportunity();
            opp.Name = 'Roshan Tech School' +i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opplist.add(opp);
        }
        if(!opplist.isEmpty()){
            insert opplist;
        }        
    }
    
  /*  13. Insert an Account along with 1 related Contact. */
    
    Public static void ApexDemo13(){
        
        Account acc = New Account();
        acc.Name = 'Rahul';
        acc.Phone = '123450';
        insert acc;
        
        if(acc.id!= Null){
            
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            insert con;
        }
    }
/*14. Insert an Account along with 1 related Contact and 1 related Opportunity.    */

    Public static void ApexDemo14(){
      
        Account acc = New Account();
        acc.Name = 'Ram Shyam1';
        insert acc;
        
        if(acc.Id!=Null){
            Contact con = New Contact();
            con.AccountId = acc.id;
            con.LastName = acc.Name;
            insert con;
            
        }
        if(acc.Id!=Null){
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.id;
            opp.Name = acc.Name;
            opp.CloseDate = system.today() + 7;
            opp.StageName = 'Prospecting';
            insert opp;
        }
        
    }    
        
/*15. Insert 5 Accounts with at least 1 related Opportunity.   */
    
    Public Static void ApexDemo15(){
        
        List<Account> acclist = New List<Account>();
        For(integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'Account' + i;
            acclist.add(acc);
        }
        if(!acclist.isEmpty()){
            insert acclist;
        }
        
        List<Opportunity> opplist = New List<Opportunity>();
        For(Account acc : acclist){
            Opportunity opp = New Opportunity();
            opp.AccountId = acc.id;
            opp.Name = acc.Name;
            opp.CloseDate = system.today();
            opp.StageName ='Prospecting';
            opplist.add(opp);
        }
        if(!opplist.isEmpty()){
            insert opplist;
        }
        
    }
    
    /*15. 16. Insert 5 Accounts and a Contact & a Opportunity related to each account.   */
    
    Public Static void ApexDemo16(){
        
        List<Account> acclist = New List<Account>();
        For(integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'Account With Con & Opp' + i;
            acclist.add(acc);
        }
        if(!acclist.isEmpty()){
            insert acclist;
        }
        
        List<Opportunity> opplist = New List<Opportunity>();
        For(Account acc : acclist){
            Opportunity opp = New Opportunity();
            opp.AccountId = acc.id;
            opp.Name = acc.Name;
            opp.CloseDate = system.today();
            opp.StageName ='Prospecting';
            opplist.add(opp);
        }
        if(!opplist.isEmpty()){
            insert opplist;
        }
        
        List<Contact> conlist = New List<Contact>();
        For(Account acc : acclist){
            Contact con = New Contact();
            con.AccountId = acc.id;
            con.LastName = acc.Name;
            conlist.add(con);
        }
        if(!conlist.isEmpty()){
            insert conlist;
        }
        
    }
    
/*  17 Query Accounts where Phone =’123456’ and update Phone to ’654321’. */ 
    
    public static void updateAccountPhoneNo(){
        
        List<Account> acclist = New List<Account>();
        acclist = [select id, Name, Phone from Account where Phone = ''];
         
        if(!acclist.isEmpty()){
            For(Account acc : acclist){
                acc.Phone = '1231231230';
            }
        }
        if(!acclist.isEmpty()){
            Update acclist;
        }
    }
    
    /* 18 Query Contacts where Email is null and update their email with  */
    
    public static void updateContactEmail(){
        
        List<Contact> conlist = New List<Contact>();
        conlist = [select id, Name, Email From Contact where Email = Null];
        
        if(!conlist.isEmpty()){
            For(Contact con : conlist){
               con.Email = 'ram@gmail.com';
               
                    
             
            }
        }
        if(!conlist.IsEmpty()){
         update conlist;
           }
    }
    
    /*19 Query Accounts where Phone =654321 and update Phone to 123456. Also create 5
new account records. [Hint : Use Upsert] */
    
    public static void updateAccountPhNoAndNewAcs(){
        
        List<Account> acclist = New List<Account>();
        acclist =[select id, Phone from Account where Phone = '123456'];
        If(!acclist.isEmpty()){
             For(Account acc : acclist){
            acc.Phone = '654321';
        }
    }
        For(integer i=1; i<=5; i++){
            Account acc = New Account();
            acc.Name = 'Upsert';
            acclist.add(acc);
        }
        
        If(!acclist.isEmpty()){
            upsert acclist;
        }
  }
    
 /*20 Query Opportunities where created date is last month and updated their stage to
closed won. Also create 5 new opportunities. [Hint: Use Upsert]  */   
    
    public static void oppCreatedLastMonth(){
        
        List<Opportunity> opplist = New List<Opportunity>();
        opplist = [select id,Name, StageName from Opportunity where CreatedDate = Last_Month];
        
        if(!opplist.isEmpty()){
            For(Opportunity opp : opplist){
            opp.StageName = 'Closed Won';
        }
    }
        
        For(integer i=1; i<=5; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Upsert statement';
            opp.CloseDate = system.today();
            opp.StageName = 'Prospecting';
            opplist.add(opp);
        }
        
        if(!opplist.isEmpty()){
            upsert opplist;
        }
        
        
}
 
/* 21 Delete account records where Phone =’123456’. Verify whether records are deleted or
not through Recycle Bin. */
    
    
    public static void deleteAccountRecords(){
        
        List<Account> acclist = New List<Account>();
        acclist = [select id from Account where Phone = '123456'];
        
        if(!acclist.isEmpty()){
            delete acclist;
        }
    }
    
    
/*22 Undelete account records deleted in previous point. Check recycle bin is not having
those records once undeleted and they will be under the accounts tab in the app.*/

public static void undeleteAccountRecords(){
List<Account> accList = New List <Account>();
accList=[SELECT ID, Name FROM Account WHERE Phone = '123456' All ROWS ];
if(!accList.IsEmpty()) {
undelete accList;
}
}   
    
/* 23 Query Accounts created last week. Now Insert one opportunity under each account.   */
    
    Public static void createRelatedRecordswithLastWeek(){
        
        
        List<Account> acclist = new List<Account>();
        List<Opportunity> oppList = new List<Opportunity>();
        acclist = [select id, Name from Account where CreatedDate = Last_Week];
   
        For(Account acc : acclist){
            
            Opportunity opp = new Opportunity();
            opp.AccountId = acc.id;
            opp.Name = acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            oppList.add(opp);
        }
        
        Insert  oppList;
        
        
        
    }
    
/* 24  Query Accounts created in the last 7 days. Now update their phone number with ‘12345678’. */ 
    
    Public static void updateRelatedRecords(){
        
        List<Account> acclist = [select id, Name from Account where CreatedDate = Last_Week];
        
        For(Account acc : acclist){
            acc.Phone = '12345678';
        }
        Update acclist;
    }
    
/* 25  Query Opportunities created in the last 7 days. If the opportunity stage is closed won
       then update description as ‘Opportunity is Closed Won’, in case of closed lost update
       description as ‘Opportunity is Closed Lost’ otherwise ‘Opportunity is Open’.*/
    
    
/* 26 Query Accounts with related contacts created in the last one month. Populated ’Total
      Contacts’ Field on Account by counting number of contacts associated with Account. If
      no contact then populate 0.*/

    
    
/* 27  Query Contacts created last week and if Mobile phone is not populated on contact
       then copy Phone of Related Account. [Child-Parent SOQL]*/
    
    
/* 28  Create a Custom Object named “Employee”. Create Name, Salary, Phone, Lookup
       (Account) fields on Employee Object. Create a Total Salary field on Account. Now Query
       Accounts created this year along with related Employees. Populate total salary of all
       related employees on account. [Parent-Child SOQL]  */
    
 /*29  Query Employees created this year and if Phone is not populated on Employee record
       then copy Phone of Related Account. [Child-Parent SOQL]*/
    
/*30   Create a lookup to Employee on Contact object. Query Contacts created last week and
       if Mobile phone is not populated on contact then copy Phone of Related Employee. */
    
/*31   Insert 200 Account records and make sure the Governor limit should not hit. Then
       delete those records as well.*/
    
    
/* 32  Delete opportunities whose stage is closed lost and created last month.   */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
       
}