public class InvocableMethodwithApex1 {
    
    @InvocableMethod(label='Delete Related Opportunities')
    Public static void DeleteRelatedOpportunity(List<id> ids){
        
        system.debug('Ids is === ' +ids);
        
        List<Opportunity> oppList = [select id from Opportunity where AccountId =: ids and StageName = 'Closed Won'];
        
        
        delete oppList;
        system.debug('delete opplist == ' +oppList);
    }
    
    
   

}