public with sharing class AccountProvider {
   
    @AuraEnabled
    public static string accountCreationMethod(Account objAcc){
        try {
            Account objAccount = new Account(Name = objAcc.Name, Rating = objAcc.Rating);

            insert objAccount;

            return 'New Account '+objAcc.Name+' and Rating '+objAcc.Rating+ ' is created';
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static string accountInsertMethod(Account objAcc){

        String regexPattern = '^[A-Z]{5}[0-9]{2}$';
        Pattern pattern = Pattern.compile(regexPattern);

        Matcher matcher = pattern.matcher(objAcc.Sic);
        boolean matchFlag = false;

        if (matcher.matches()) {
            matchFlag = true;
        } else {
            matchFlag = false;
        }

        if(objAcc.Website.endsWith('.com') && objAcc.AccountNumber.length() >=5 && matchFlag ){
            System.debug('#Received data = '+objAcc);
            insert objAcc;
            return objAcc.Name +' this Account record has been created...!!!';
        }
        else{
            return 'Can not create Account Record...!!';
        }
            
        }
        
        @AuraEnabled
        public static list<Account> accountSearchMethod(Account objAcc){
            try {

                return  [Select Id, Name, Rating, CreatedDate, SLA__c From Account Where Name =: objAcc.Name];

                
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static list<Account> searchByTypeMethod(Account objAcc){
            try {
                
                return [Select Id, Name, Type, SLA__c, Rating, CreatedDate From Account Where Type =: objAcc.Type];
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static list<Account> showLatestRecordMethod(Account objAcc){
            try {

              return [Select Id, Name, Rating, Type, CreatedDate From Account order by CreatedDate desc limit 10];
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static list<Account> recordShowByDateAndType(Account objAcc, Date frmDate, Date toDte){
            try {

                return [Select Id, Name, Type, Rating, CreatedDate From Account Where Type =: objAcc.Type and CreatedDate >= : frmDate and CreatedDate <= : toDte];
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static list<Account> searchRecordByFirstLetter(Account objAcc){
            try {
                
                return [Select Id, Name, Type, Rating From Account Where Name Like : objAcc.Name+'%' and Type =: objAcc.Type];
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static list<Account> deleteAccountRecordMethod(list<Id> accIdList, Account objAcc){
            try {

                list<Account> accList = [Select Id From Account Where ID IN : accIdList];
                delete accList;

                return [Select Id, Name, Type, SLA__c, Rating, CreatedDate From Account Where Type =: objAcc.Type];
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static list<Contact> relatedRecordsMethod(Account objAcc){
            try {

                return [Select Id, FirstName, LastName From Contact Where Account.Name =: objAcc.Name];
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static list<Opportunity> opportunityRecordMethod(Account objAcc){
            try {

                return [Select id, Name, Amount, CloseDate, StageName From Opportunity Where Account.Name =: objAcc.Name];
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static list<Account> accountRecordMethod(Account objAcc){
            try {

              return AccountProviderNew.showingAccountRecordMethod();
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled(Cacheable = true)
        public static list<Account> callingApexByWireMethod(Id accid){
            try {

                return [Select Id, Name, Rating, Type From Account where Id =: accid];
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

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
        public static Account searchAccountMethod(Account objAcc){
            try {

                return [Select Id, Name, Type, SLA__c, CreatedDate From Account Where Name  =: objAcc.Name];
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static Account updateAccountMethod(Account objAcc){
            try {

                update objAcc;

                return [Select Id, Name, Type, SLA__c From Account Where Name =: objAcc.Name];
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static string deleteAccountMethod(Account objAcc){
            try {

                delete objAcc;

                return 'Account record deleted successfully';
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }

        @AuraEnabled
        public static List<Account> showAccNameMethod(Account objAcc){
            try {

                return [Select Id, Name, Type, Rating, SLA__C, CreatedDate From Account Where Type =: objAcc.Type];
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }
        
    }