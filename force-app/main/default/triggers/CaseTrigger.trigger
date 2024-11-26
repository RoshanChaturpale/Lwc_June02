trigger CaseTrigger on Case (after insert, after update, after delete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            CaseTriggerHandler.updateLatestCaseNumber(Trigger.new, Trigger.oldMap);
        }
        if (Trigger.isDelete) {
            CaseTriggerHandler.handleCaseDeletion(Trigger.old);
        }
    }
}