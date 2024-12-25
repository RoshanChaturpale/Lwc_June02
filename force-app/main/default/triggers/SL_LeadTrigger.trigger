trigger SL_LeadTrigger on Lead (before insert,before update,after insert,after update) {
    
    
    if(trigger.isBefore){
            if(trigger.isInsert || trigger.isUpdate){
                SL_LeadTriggerHandler.doBeforeInsertUpdate(trigger.New);
        }
        
    }
    
    if(trigger.isAfter)
    {
        if(trigger.isInsert){
           // SL_LeadTriggerHandler.sendEmailToQueue(trigger.new);
            SL_LeadTriggerHandler.leadMovementTaskCreation(trigger.new,null);
          //  system.debug('after insert Trigger.new '+Trigger.new);
            
        }
        else if(trigger.isUpdate){
           SL_LeadTriggerHandler.leadMovementTaskCreation(trigger.new,trigger.oldMap);
           // system.debug(' after up Trigger.new '+Trigger.new);
            //system.debug('after up Trigger.old '+Trigger.old);
        }
    }
    

}