public class accountData {
    
     @AuraEnabled(Cacheable=true)
    Public static List<Account> accData(){
        
        List<Account> acclist = new List<Account>();
        acclist = [select id, Name, Phone From Account limit 10];
        
        return acclist;
    }
    
    @AuraEnabled(Cacheable=true)
    Public static List<Account> searchAccountData(string searchName){
        
        List<Account> accountlist  = new List<Account>();
        accountlist = [select id, Name from Account where Name =: searchName];
        
        return accountlist;
    }
    
    
    @AuraEnabled(Cacheable = true)
    public static list<Account> getAccountData(String textkey) {
        textkey = '%' + textkey + '%';
        list<Account> accLst = [SELECT  Id, Name, Industry, Phone, Type From Account WHERE Name LIKE :textkey];
        
        if(accLst.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return accLst; 
    }
    
    
     @AuraEnabled(Cacheable = TRUE)
    public static List<Account> getAccounts() {
 
        List<Account> accList = [SELECT Id, Name, Phone, Industry, TYPE, Website, Description FROM Account WHERE Phone != NULL AND Industry != NULL ORDER BY CreatedDate DESC ];
 
        RETURN accList;
    }  
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountss(){
        return[select id, Name from Account Limit 10];
}
    
    @AuraEnabled(cacheable=true)
    public static List<Account> imperative_getAccountData(){
        list<Account> accountList =[select id, Name, Rating , Phone from Account Limit 5];
        return accountList;
}
    
    @AuraEnabled
    public static List<Account> comboBoxDemo_getAccount(){
        list<Account> accountList =[select id, Name from Account];
        return accountList;
}
        
    }