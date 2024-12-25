public class ApexDemo {
    
/*1. Query 5 Account records into a list. Now iterate on a list and create a set of account
Ids and display values of the set.*/
Public static void apexDemo1(){
        
        set<id> setids = new set<id>();
        List<Account> accountList = new List<Account>();
        accountList = [select id, Name from Account Limit 5];
        
        For(Account acc : accountList){
           setids.add(acc.id);
        }
        system.debug('setids is --- ' + setids);
        
        For(id i : setids){
            system.debug('Account id == ' +i);
        }
    }

/*2. Query 5 Account records into a list. Now iterate on a list and create a map where key
will be account Id and value will be Account sObject (using loop) and display values of
map.*/
    Public static void apexDemo02(){
        
        List<Account> accountList = new List<Account>();
        Map<id, Account> accMap = New Map<id, Account>();
        accountList = [select id, Name, Phone from Account limit 5];
        
        For(Account acc : accountList){
            accMap.put(acc.id, acc);
        }
        //system.debug('accMap is === '+ accMap);
       // system.debug('accMap is === '+ accMap.values());
        
        For(id i : accMap.keySet()){
            system.debug('i is === ' + i);
            system.debug('accMap key set is ==' +accMap.get(i));
        }
    }

/*3. Query 5 Account records into a list. Now create a map where key will be account Id and
value will Account sObject (without using loop) and display values of map.*/
    Public static void apexDemo03(){
        
        List<Account> accountList = new List<Account>();
        accountList = [select id, Name from Account Limit 5];
        
        Map<id, Account> accMap = New Map<id, Account>(accountList);
        
        system.debug('accMap is ==' +accMap.values());
        
        For(id i : accMap.keySet()){
            system.debug('accMap is == ' +accMap.get(i));
        }
        
    }
    
/*4. Query 5 Account records into a list. Now create a set of Account ID and Map <Id,
Account> using a list. Now iterate on set and check whether set values match with map
key, if yes then display map value.*/
    Public static void apexDemo04(){
        
        set<id> setids = new set<id>();
        Map<id, Account> accMap = New Map<id, Account>();
        
        List<Account> accountList = new List<Account>();
        accountList = [select id , Name from Account Limit 5];
        
        For(Account acc : accountList){
            setids.add(acc.id);
        }
        //system.debug('setids is ===' +setids);
        
        For(Account acc : accountList){
            accMap.put(acc.id, acc);
        }
        //system.debug('setids is ===' +accMap);

        
        For(id i : setids){
            if(setids.contains(i)){
                system.debug('accMap is === ' + accMap.get(i));
            }
        }
        
        system.debug('-----------------------------');
        
        For(id i : accMap.keySet()){
            system.debug('accMap is == ' +accMap.get(i));
        }   
    }
    
  /*5. Query This/Last Week created Accounts with related contacts*/
    Public static void apexDemo05(){
        
        List<Account> accountList = New List<Account>();
        accountList = [select id, Name, (select id, FirstName, LastName from Contacts) From Account where CreatedDate = Last_Week];
        
        For(Account acc : accountList){
            system.debug('Account Name is==:' +acc.Name);
            system.debug('Total related Contacts==:' + acc.Contacts.Size());
            for(Contact con : acc.Contacts){
                system.debug('Contact FirstName is==:' + con.LastName);
            }
            
        }
        
    }
    
    /*6. Query This/Last Week created contacts with related account Name and Phone.*/
    
    Public static void apexDeme06(){
        
        List<Contact> contactList = new List<Contact>();
        contactList = [select id, Name, FirstName, LastName,  Account.Name, Account.Phone from Contact where CreatedDate = Last_week];
        
        For(Contact con : contactList){
          system.debug('Contact Name is==:' +con.Name + ', Account Name is==:' + con.Account.Name + ', Phone Number is===:' + con.Account.Phone);
        }
        
    }
    

/*7. Query Account (Id, Name, Phone) with Related Opportunities (Name, CloseDate, Stage)
      where Account Phone != null. Sort the records in both Asc or Desc Order based on
      CreatedDate.  */
    
    Public static void apexDemo07(){
        
        List<Account> accountList = new List<Account>();
        accountList = [select id ,Name, Phone,(select Name, StageName, CloseDate from Opportunities ) from Account where Phone != Null  ORDER By CreatedDate asc];
        
        System.debug('accountList Size is == ' + accountList.Size());
        
        For(Account acc : accountList){
            
            system.debug('Account Name is == ' +acc.Name);
            system.debug('Opportunity Size is == ' +acc.Opportunities.size());
            
            For(Opportunity opp : acc.Opportunities){
                system.debug('Opp Name is == ' + opp.Name + ' , Opp Stage Name is == ' + opp.StageName);
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}