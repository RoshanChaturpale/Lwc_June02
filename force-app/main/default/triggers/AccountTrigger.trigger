trigger AccountTrigger on Account (before insert,Before update, Before delete,  After insert, After update, after delete, after undelete) {
 
    if(trigger.isInsert && trigger.isAfter){                         //After Insert
   //  AccountTriggerHandler.AccountToContact(Trigger.new);
    // AccountTriggerHandler.CreateContactOrOpportunityWithCheckBox(Trigger.new);
     //AccountTriggerHandler.CreateContactwithIndustryisBaking(trigger.New);
     //AccountTriggerHandler.CreateRelatedOpportunity(Trigger.New);
      // AccountTriggerHandler.CopyPhoneAccToContact(Trigger.New); 
     //AccountTriggerHandler.CreateContactsWithNumber(Trigger.New);
     //
     //AccountTriggerHandler.method1(Trigger.new);
     
     //AccountTriggerHandler.mergeDuplicateAccounts(trigger.new);
       
    
          }
    else if(trigger.isUpdate && trigger.isAfter){                   //After Update
    
        if(PreventRecursion.firstcall){
            PreventRecursion.firstcall = True;
            // AccountTriggerHandler.CreateContactOrOpportunityWithCheckBox(Trigger.new);
            // AccountTriggerHandler.CopyPhoneAccToContact(Trigger.New); 
           // AccountTriggerHandler.UpdateRelatedContactsWithSOQL(Trigger.New, Trigger.oldMap);
           //AccountTriggerHandler.CreateContactsWithNumber(Trigger.New);
           // AccountTriggerHandler.CreateContactwithIndustryisBaking(trigger.New);
          
          
          
          
        }
       // AccountTriggerHandler.deleteRelatedOpportunity(trigger.old);
        // AccountTriggerHandler.afterUpdate(trigger.new, trigger.oldMap);
      // AccountTriggerHandler.updateAccountStatus(trigger.New);
      //AccountTriggerHandler.updateContactDescriptionWithAccountOwnership(trigger.new);
     //   AccountTriggerHandler.AccountTOContactAddress(trigger.new);
      //AccountTriggerHandler.updateRelatedContactDescription(trigger.New, trigger.oldMap); 
      // AccountTriggerHandler.updateRelatedContactsWithMap(trigger.new, trigger.oldMap);
      // 
         //  AccountTriggerHandler.mergeDuplicateAccounts(trigger.new);

    }
    
   else if(trigger.isDelete && trigger.isAfter){                    //After Delete
       
    }
    
    else if(trigger.isUnDelete && trigger.isAfter){                 //After UnDelete
       
    }
    
    else if(trigger.isInsert && trigger.isBefore){                  //Before Insert
    
       // AccountTriggerHandler.beforeInsert(trigger.new);
       //  AccountTriggerHandler.DuplicateEmail(Trigger.New);
       //AccountTriggerHandler.DuplicatePhone(Trigger.New);
       // AccountTriggerHandler.preventDuplicateAccountEmailAndPhone(trigger.New);
      // AccountTriggerHandler.onBeforeInsert(Trigger.new);
      // AccountTriggerHandler.handleAccounts(Trigger.new);
      //  AccountTriggerHandler.handleAccounts1(Trigger.new);
      //  
      //AccountTriggerHandler.duplicateName(Trigger.New);
        
     //AccountTriggerHandler.ValidationBeforeInsert(Trigger.New);
    //  AccountTriggerHandler.BeforeUpdate(Trigger.New);
     // AccountTriggerHandler.CreateRelatedOpportunity(Trigger.New);
     // AccountTriggerHandler.Practice(Trigger.new);
    // AccountTriggerHandler.duplicateEmailAndPhonePrevention(trigger.New);
    // 
   // AccountTriggerHandler.beforeInserHandller(trigger.New);
    }
    else if(trigger.isUpdate && trigger.isBefore){                  //Before update
  
    //   AccountTriggerHandler.OldandNew(Trigger.New, trigger.oldMap);
       // AccountTriggerHandler.BeforeUpdate(Trigger.New);
      // AccountTriggerHandler.onBeforeUpdate(Trigger.new, Trigger.oldMap);
      //AccountTriggerHandler.handleAccounts(Trigger.new);
      //  AccountTriggerHandler.handleAccounts1(Trigger.new);
      //  
      
    
    }
    
   else if(trigger.isDelete && trigger.isBefore){                   //Before Delete
    // AccountTriggerHandler.deleteContacts(Trigger.old);
   //AccountTriggerHandler.PreventDeletionRelatedRecords(Trigger.old);
     //AccountTriggerHandler.CantDeleteAccountwithCheckBox(trigger.old);
    }
    
}