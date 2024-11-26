trigger RoomTrigger on Room__c (After insert, After Update , After Delete , After unDelete) {
    
    if(trigger.isInsert && trigger.isAfter){
        RoomTriggerHandller.Method(trigger.New);
    }
    else if(trigger.isUpdate && trigger.isAfter){
       RoomTriggerHandller.Method(trigger.Old);

    }
    else if(trigger.isDelete && trigger.isAfter){
       //RoomTriggerHandller.Method(trigger.Old); 
    }
    else if(trigger.isUndelete && trigger.isAfter){
        RoomTriggerHandller.Method(trigger.New);
    }

}