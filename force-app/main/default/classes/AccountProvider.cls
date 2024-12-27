public with sharing class AccountProvider {
   
    @AuraEnabled
        public static string accountCreationMethodForCrud(Account objAcc){
            try {

                Insert objAcc;

                return 'Account is created';
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }


        @AuraEnabled
        public static List<Account> searchAccount(Account objAcc){
            try {
                List<Account> acclist = New List<Account>();
                acclist = [Select id, Name, Rating, Account_Email__c  From Account Where Name =: objAcc.Name];
                
                return acclist;
                } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }
}