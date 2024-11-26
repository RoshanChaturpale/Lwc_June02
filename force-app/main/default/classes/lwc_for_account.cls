public class lwc_for_account {
    
    @AuraEnabled(cacheable=true)
    public static list<Account> method1(){
        
        list<Account> acclist = new List<Account>();
        acclist = [select id, Name From Account limit 10];
        
        return acclist;
    }

}