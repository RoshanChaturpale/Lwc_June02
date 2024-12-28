public without sharing class AccountProviderNew {
    
    public static list<Account> showingAccountRecordMethod(){
        return [Select Id, Name, CreatedBy.Name From Account];
    }
}