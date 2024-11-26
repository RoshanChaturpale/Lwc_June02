trigger OpportunityTrigger on Opportunity (before insert, before update, before delete,After insert, after update, after delete, after undelete) {

    if(trigger.isInsert && trigger.isAfter){                        //After Insert
       //  OpportunityTriggerHandller.PopulateLatestOppAmt(Trigger.New);
        // OpportunityTriggerHandller.TotalOpportunitiesAndTotalAmount(trigger.new , null);
       // OpportunityTriggerHandller.updateAccountRating(trigger.new);
       // OpportunityTriggerHandller.sendEmailNotification(trigger.new);
    }
    else if(trigger.isUpdate && trigger.isAfter){                   //After Update
    //  OpportunityTriggerHandller.PopulateLatestOppAmt(Trigger.New);
    //  OpportunityTriggerHandller.TotalOpportunitiesAndTotalAmount(trigger.new ,trigger.old);
      //   OpportunityTriggerHandller.updateAccountRating(trigger.new);
       // OpportunityTriggerHandller.metho1(trigger.New);
      // OpportunityTriggerHandller.OpptoTask(trigger.New);
    }
    
   else if(trigger.isDelete && trigger.isAfter){                    //After Delete
   //  OpportunityTriggerHandller.TotalOpportunitiesAndTotalAmount(trigger.old ,null);
    // OpportunityTriggerHandller.PopulateLatestOppAmt(Trigger.old);

    }
    
    if(trigger.isUnDelete && trigger.isAfter){                 //After UnDelete
    //  OpportunityTriggerHandller.TotalOpportunitiesAndTotalAmount(trigger.new , null);
      // OpportunityTriggerHandller.PopulateLatestOppAmt(Trigger.New);

    }
    
    else if(trigger.isInsert && trigger.isBefore){                  //Before Insert
       // OpportunityTriggerHandller.UpdateDescription(Trigger.New);
    }
    else if(trigger.isUpdate && trigger.isBefore){                  //Before update
      
    }
    
   else if(trigger.isDelete && trigger.isBefore){                   //Before Delete
       
    }

    
}