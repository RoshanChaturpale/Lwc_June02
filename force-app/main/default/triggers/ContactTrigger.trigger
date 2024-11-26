trigger ContactTrigger on Contact (after insert, after undelete,after update, after delete,Before insert, before update, Before Delete) {
    
  if(trigger.isInsert && trigger.isAfter){
      // ContactTriggerHandller.UpdateContactToAccount(Trigger.new);
     //ContactTriggerHandller.CountContacts(Trigger.New);
    }
    else if(trigger.isUpdate && trigger.isAfter){
       //ContactTriggerHandller.Method1(Trigger.New);
    }
    else if(trigger.isUndelete && trigger.isAfter){
       
    }                                              
    
    else if(trigger.isDelete && trigger.isAfter){
      
    }
   else if(trigger.isInsert && trigger.isBefore){ 
    //  ContactTriggerHandller.setMailingCountryFromAccount(Trigger.new);
       //  ContactTriggerHandller.AccountBillingToContactMailling(Trigger.New);                         //Before Insert
    //   ContactTriggerHandller.validateEmailAndPhone(Trigger.new);
     //  ContactTriggerHandller.preventDuplicateContactEmailAndPhone(trigger.New);
      
   }
    
    else if(trigger.isUpdate && trigger.isBefore){                  //Before update
         }
    
   else if(trigger.isDelete && trigger.isBefore){                   //Before Delete
  // ContactTriggerHandller.cantdeleteContact(Trigger.old);
      
    }
   

   

}