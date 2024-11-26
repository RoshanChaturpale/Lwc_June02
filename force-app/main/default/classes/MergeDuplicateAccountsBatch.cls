global class MergeDuplicateAccountsBatch implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([select id, FirstName, LastName, PersonEmail, Phone from account where IsPersonAccount = true AND RecordType.Name = 'Person Account' ORDER BY FirstName, LastName, PersonEmail, Phone DESC]);
    }

    global void execute(Database.BatchableContext bc, List<Account> scope) {
        Map<String, List<Account>> duplicateAccounts = new Map<String, List<Account>>();

        for (Account acc : scope) {
            String key = acc.FirstName + acc.LastName + acc.PersonEmail + acc.Phone;

            if (!duplicateAccounts.containsKey(key.toLowerCase())) {
                System.debug('key not ::: '+key.toLowerCase());
                duplicateAccounts.put(key.toLowerCase(), new List<Account>());
            }
			System.debug('key ::: '+key.toLowerCase());
            duplicateAccounts.get(key.toLowerCase()).add(acc);
        }

        for (List<Account> accountList : duplicateAccounts.values()) {
            Account masterAccount = accountList[0];

            for (Integer i = 1; i < accountList.size(); i++) {
                Account duplicateAccount = accountList[i];

                // Merge duplicateAccount into masterAccount using appropriate logic
                // For example, you can use the merge() method to merge the accounts
                Database.merge(masterAccount, duplicateAccount);
            }
        }
    }

    global void finish(Database.BatchableContext bc) {
        // Implement any post-processing logic if required
    }
}