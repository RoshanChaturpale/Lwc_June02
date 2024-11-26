public class ApexAccount {
    
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

}