public class SL_LeadTriggerHandler {
    
    Public static void doBeforeInsertUpdate(List<Lead> newLead){
        
        //Getting Sales Rep "Queue"
        Group groupQuery = [select id, DeveloperName, Type from Group where DeveloperName = 'Sales_Representative_Queue' and type='queue'];
        system.debug('groupQuery is ====>>' +groupQuery);
        
        For(Lead leadIterate : newLead){
            if((leadIterate.LeadSource == 'ISO' || leadIterate.LeadSource == 'Pre Approval') && 
               leadIterate.OwnerId != groupQuery.Id && leadIterate.Status == 'New')
            {
                leadIterate.OwnerId = groupQuery.id;
                system.debug('groupQuery is ====>>' +leadIterate.OwnerId);
            }
            
            if(leadIterate.Company == null){
                leadIterate.Company = leadIterate.FirstName != null ? leadIterate.FirstName+' '+leadIterate.LastName : leadIterate.LastName; 
            }
            
        }
    }
    
    
 
    
    public static void leadMovementTaskCreation(List<Lead> leadList , Map<Id,Lead> oldLeadMap){
        
        List<Task> taskList = new List<Task>();
        Map<String, SL_Lead_Task_Metadata__mdt> mapEd = SL_Lead_Task_Metadata__mdt.getAll();	
        system.debug('mapEd '+mapEd);
        Map<Id, Group> groupIdAndGroupMap = new Map<Id,Group>([select Id,OwnerId,DeveloperName from Group where 
                                                               DeveloperName IN  ('SL_Underwriting_Queue','Sales_Representative_Queue')
                                                               and Type = 'Queue']);
        
        map<string,Group> developerNameAndGroupMap = new map<string,Group>();
        for(Group groupObj :groupIdAndGroupMap.values()){
            developerNameAndGroupMap.put(groupObj.DeveloperName,groupObj);
        }                                                                           
        system.debug('map'+groupIdAndGroupMap);
        
        for(Lead leadObj:leadList){
            system.debug('inside for');
            if(leadObj.Status != null && (oldLeadMap == null || oldLeadMap.get(leadObj.Id).Status != leadObj.Status)){
                system.debug('inside first if');
                for(SL_Lead_Task_Metadata__mdt meta:mapEd.values()){
                    
                    system.debug('inside second for');
                    if(meta.Lead_Status__c == leadObj.Status){
                        system.debug('meta.Lead_Status__c '+meta.Lead_Status__c);
                        system.debug('leadObj.Status '+leadObj.Status);
                        system.debug('inside Second if');
                        Task tsk = new Task();
                        tsk.Subject = meta.label;
                        tsk.Status = 'Open';
                        tsk.Priority = 'Normal';
                        tsk.Description = meta.Description__c;
                        tsk.Stage__c = meta.Lead_Status__c;   //on Activity Object search field Stage__C
                        tsk.WhoId = leadObj.Id;
                        if(meta.Task_Owner__c == 'SL_Underwriting_Queue'){
                            tsk.OwnerId = developerNameAndGroupMap.get('SL_Underwriting_Queue').Id;
                            System.debug('if'+tsk.OwnerId);
                        }else if(leadObj.OwnerId == developerNameAndGroupMap.get('Sales_Representative_Queue').Id){
                            tsk.OwnerId = developerNameAndGroupMap.get('Sales_Representative_Queue').Id; 
                            System.debug('else '+tsk.OwnerId);
                        }
                        taskList.add(tsk);
                        system.debug('taskList'+taskList);
                    }
                }
            }
        }
        if(taskList.size() > 0){
            insert taskList;
            system.debug('taskList'+taskList);
        }
    } 
}