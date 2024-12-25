trigger opportunityTrigger on Opportunity (before insert, After insert, After Update) {
    
    
    if(trigger.isInsert && trigger.isAfter){
        opportunityTriggerHandler.updateAccountRating(trigger.new);
        
    }else if(trigger.isUpdate && trigger.isAfter){
         if(PreventRecursion.firstcall){
            PreventRecursion.firstcall = True;
               opportunityTriggerHandler.updateAccountRating(trigger.new);
        }   
    }

}