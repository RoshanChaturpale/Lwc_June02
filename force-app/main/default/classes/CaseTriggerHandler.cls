public class CaseTriggerHandler {
    
    /* 1.whenever Case is Created or Updated the related Account Field Named 'Latest_Case_Number' has to be populated with Case number.                      
    
       2.Whenever Case is Assigned to a New Account (parent is changed), The new Account's  'Latest_Case_Number' Field has to be populated with the case number of this record. And the Old Parent Latest_Case_Number field has to be null.   

       3. Whenever the Case Record Assigned to a parent is deleted , that Account's Latest_Case_Number field has to be null.  
  
    */

    public static void updateLatestCaseNumber(List<Case> newCases, Map<Id, Case> oldCaseMap) {
        Set<Id> accountIdsToUpdate = new Set<Id>();
        Map<Id, String> accountToCaseNumberMap = new Map<Id, String>();

        for (Case newCase : newCases) {
            if (newCase.AccountId != null) {
                accountIdsToUpdate.add(newCase.AccountId);
                accountToCaseNumberMap.put(newCase.AccountId, newCase.CaseNumber);
            }
            
            // Handle the scenario where AccountId is changed
            if (oldCaseMap != null && oldCaseMap.containsKey(newCase.Id)) {
                Case oldCase = oldCaseMap.get(newCase.Id);
                if (oldCase.AccountId != null && oldCase.AccountId != newCase.AccountId) {
                    accountIdsToUpdate.add(oldCase.AccountId);
                    accountToCaseNumberMap.put(oldCase.AccountId, null);
                }
            }
        }

        // Query Accounts related to the Cases
        List<Account> accountsToUpdate = [SELECT Id, Latest_Case_Number__c FROM Account WHERE Id IN :accountIdsToUpdate];
        
        // Update the Latest_Case_Number__c field on each Account
        for (Account acc : accountsToUpdate) {
        // acc.Latest_Case_Number__c = accountToCaseNumberMap.get(acc.Id);
        }

        // Perform DML update
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }

    public static void handleCaseDeletion(List<Case> oldCases) {
        Set<Id> accountIdsToUpdate = new Set<Id>();

        for (Case oldCase : oldCases) {
            if (oldCase.AccountId != null) {
                accountIdsToUpdate.add(oldCase.AccountId);
            }
        }

        // Query Accounts related to the Cases
        List<Account> accountsToUpdate = [SELECT Id, Latest_Case_Number__c FROM Account WHERE Id IN :accountIdsToUpdate];
        
        // Set the Latest_Case_Number__c field to null on each Account
        for (Account acc : accountsToUpdate) {
           // acc.Latest_Case_Number__c = null;
        }

        // Perform DML update
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}