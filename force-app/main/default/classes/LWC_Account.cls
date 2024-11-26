public class LWC_Account {
    
    Public static list<Account> Method1(){
        
        
        List<Account> acclist = new List<Account>();
        
        acclist = [select id, Name from Account Limit 5];
        
        return acclist;
        
        
    }

}