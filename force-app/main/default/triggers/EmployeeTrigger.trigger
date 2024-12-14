trigger EmployeeTrigger on Employee__c (after insert) {
    if (Trigger.isAfter && trigger.isInsert) {
        EmployeeTriggerHandler.mergeDuplicateEmployees(Trigger.new);
    }
    else if(trigger.isAfter && trigger.isUpdate) {
        EmployeeTriggerHandler.mergeDuplicateEmployees(Trigger.new);
 
    }
}