trigger AccountTrigger on Account (before insert, Before Update, Before delete, After Insert, After update, After Delete, After Undelete) {
    
    
    If(trigger.isInsert && trigger.isBefore){
        // AccountTriggerHandler.practiceBeforeInsertMethod(trigger.New);
       // AccountTriggerHandler.beforeInsertUpdate(trigger.New);
       // AccountTriggerHandler.validationWithDuplicateEmail(trigger.New);
       // AccountTriggerHandler.validationWithDuplicatePhone(trigger.new);
    }
    else if(trigger.isUpdate && trigger.isBefore){
       // AccountTriggerHandler.method1(trigger.New,trigger.old);
    }
    else if(trigger.isDelete && trigger.isBefore){
      //AccountTriggerHandler.deleteContacts(trigger.old);
    
    }
    else if(trigger.isInsert && trigger.isAfter){
       // AccountTriggerHandler.createRelatedContact(trigger.New);
       // AccountTriggerHandler.createRelatedOpportunity(trigger.new);
       // AccountTriggerHandler.createRelatedConOppwithCheckBox(trigger.new);
    }
    else if(trigger.isUpdate && trigger.isAfter){
        
       if(PreventRecursion.firstcall){
            PreventRecursion.firstcall = True;
           
         //  AccountTriggerHandler.createRelatedContact(trigger.New);
         //  AccountTriggerHandler.createRelatedOpportunity(trigger.new);
            
          
        } 
       // AccountTriggerHandler.updateRelatedContactsWithSOQL(trigger.new, trigger.oldMap);
        
         
        
        
        
    }
    else if(Trigger.isDelete  && Trigger.isAfter){
       // AccountTriggerHandler.deleteRelatedOpportunities(Trigger.old);
    }
    
    
    
    
    
    
   
}