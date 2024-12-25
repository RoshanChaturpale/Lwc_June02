public class opportunityTriggerHandler {
    
    
/*Update Account Rating to 'Hot 'on account when opportunity stage equals 'closed one'  */
    
    Public static void updateAccountRating(List<Opportunity> oppList){
        
        List<Account> acclist = new List<Account>();
        set<id> setids = new set<id>();
        For(Opportunity opp :oppList){
            if(opp.StageName == 'Closed Won'){
                setids.add(opp.AccountId);
            }
            system.debug('setids for Closed Won is ===  ' +setids);
            
        }
        
        List<Account> accountList  = [select id, Rating from Account Where id IN : setids];
        
        For(Account acc : accountList){
            acc.Rating = 'Hot';
            accList.add(acc);
        }
        Update accList;
        
        
    }

}