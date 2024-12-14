public class EmployeeTriggerHandler {
    public static void mergeDuplicateEmployees(List<Employee__c> newList) {
        // Define a list of record type names (if applicable)
       // List<String> recordTypeNames = new List<String>{'RecordType1', 'RecordType2', 'RecordType3'};
        List<Employee__c> employeeList = new List<Employee__c>();
        List<Id> employeeIds = new List<Id>();

        // Step 1: Collect IDs from the incoming records
        if (!newList.isEmpty()) {
            for (Employee__c empObj : newList) {
                employeeIds.add(empObj.Id);
            }
            System.debug('employeeIds ===> ' + employeeIds);
        }

        // Step 2: Query existing records based on the collected IDs
        if (employeeIds != null && !employeeIds.isEmpty()) {
            employeeList = [SELECT Id, Name,First_Name__c, Last_Name__c, Email__c FROM Employee__c WHERE Id IN :employeeIds];
        }

        // Step 3: Compare and find duplicates
        if (!employeeList.isEmpty()) {
            for (Employee__c empObj : employeeList) {
                // Query records matching criteria
                List<Employee__c> matchingEmployees = [
                    SELECT Id, Name, First_Name__c, Last_Name__c, Email__c
                    FROM Employee__c
                    WHERE First_Name__c = :empObj.First_Name__c 
                    AND Last_Name__c = :empObj.Last_Name__c 
                    AND Email__c = :empObj.Email__c
                     ];

                System.debug('matchingEmployees ===> ' + matchingEmployees);

                // Step 4: Merge duplicates
                if (!matchingEmployees.isEmpty()) {
                    
                    for (Employee__c mergeAccObj : matchingEmployees) {
                            Database.merge(empObj, mergeAccObj, false);
                        }
                    
                    }
            }
        }
    }
}