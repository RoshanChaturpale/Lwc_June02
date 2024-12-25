public class SL_LeadTriggerHandler {
    
    Public static void doBeforeInsertUpdate(List<Lead> newLead) {
        
        
        Group groupQuery = [select id, DeveloperName, Type from Group where DeveloperName = 'Sales_Representative_Queue' and type='queue'];
        system.debug('groupQuery is ====>>' +groupQuery);
        
        
        For(Lead leadIterate : newLead){
            if((leadIterate.LeadSource == 'ISO' || leadIterate.LeadSource == 'Pre Approval') && 
               leadIterate.OwnerId != groupQuery.Id && leadIterate.Status == 'New'){
                   
                   leadIterate.OwnerId = groupQuery.id;
                   system.debug('groupQuery is ====>>' +leadIterate.OwnerId);
                
                
            }
            
        }
    }
    
    public static void leadMovementTaskCreation(List<Lead> leadList , Map<Id,Lead> oldLeadMap){
        
        
        List<Task> taskList = new List<Task>();
        Map<String, SL_Lead_Task_Metadata__mdt> mapEd = SL_Lead_Task_Metadata__mdt.getAll();
        system.debug('mapEd' +mapEd);
        
        Map<id, Group> groupIdAndGroupMap = new Map<id, Group>([select id, OwnerId, DeveloperName From Group where DeveloperName IN ('SL_Underwriting_Queue','Sales_Representative_Queue') and Type = 'Queue']);
        
        map<string, Group> developerNameAndGroupMap = new map<string, Group>();
        For(Group groupObj : groupIdAndGroupMap.values()){
            developerNameAndGroupMap.put(groupObj.DeveloperName,groupObj);
        }
        system.debug('map'+groupIdAndGroupMap);
        
        
        For(Lead lead : leadList){
            system.debug('inside for');
            
            if(lead.Status != null && (oldLeadMap == null || oldLeadMap.get(lead.Id).Status != lead.Status)){
                system.debug('inside first if');
                
                For(SL_Lead_Task_Metadata__mdt meta : mapEd.values()){
                    system.debug('inside second for');
                    
                    if(meta.Lead_Status__c == lead.Status){
                        system.debug('meta.Lead_Status__c ==' +meta.Lead_Status__c);
                        system.debug('lead.Status ==' +lead.Status);
                        system.debug('inside second if');
                        
                        Task tsk = new Task();
                    
                        tsk.Subject = meta.Label;
                        tsk.Status = 'Open';
                        tsk.Priority = 'Normal';
                        tsk.Description = meta.Description__c;
                        tsk.Stage__c = meta.Lead_Status__c;     //on Activity Object search field Stage__C
                        tsk.WhoId = lead.Id;
                        
                       /* if(meta.Task_Owner__c == 'SL_Underwriting_Queue'){
                            tsk.OwnerId = developerNameAndGroupMap.get('SL_Underwriting_Queue').Id;
                            System.debug('if'+tsk.OwnerId);
                        }else if(leadObj.OwnerId == developerNameAndGroupMap.get('Sales_Representative_Queue').Id){
                            tsk.OwnerId = developerNameAndGroupMap.get('Sales_Representative_Queue').Id; 
                            System.debug('else '+tsk.OwnerId);
                        }
                        */
                        
                        taskList.add(tsk);
                        
                        system.debug('taskList == ' +taskList);
                        
                       
                        
                    }
                    
                }
                
            }
            
        }   
        
        If(taskList.size() > 0){
            insert taskList;
            system.debug('taskList == ' +taskList);
        }
        
        
    }
    

}