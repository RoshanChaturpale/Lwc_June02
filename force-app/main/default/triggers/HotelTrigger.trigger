trigger HotelTrigger on Hotel__c (before insert,Before update, Before delete,  After insert, After update, after delete, after undelete) {

    if(trigger.isInsert && trigger.isAfter){                         //After Insert
   
      HotelTriggerHandller.AfterInsertMethodUsingList(Trigger.new);
      HotelTriggerHandller.AfterInsertUsingMap(Trigger.NewMap);  
    }
    else if(trigger.isUpdate && trigger.isAfter){                   //After Update
      
    }
    
   else if(trigger.isDelete && trigger.isAfter){                    //After Delete
       
    }
    
    else if(trigger.isUnDelete && trigger.isAfter){                 //After UnDelete
       
    }
    
    else if(trigger.isInsert && trigger.isBefore){               //Before Insert
     
        HotelTriggerHandller.BeforeInsertMethod(Trigger.New);
    }
    else if(trigger.isUpdate && trigger.isBefore){                  //Before update
     
    }
    
   else if(trigger.isDelete && trigger.isBefore){                   //Before Delete
       
      
    }
    
}