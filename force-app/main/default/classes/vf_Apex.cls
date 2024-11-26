public class vf_Apex {
    public Account newAccount { get; set; }
    Public string s{get;set;}
    public List<Account> accountList{get;set;}

    public vf_Apex() {
        newAccount = new Account();
    }

     public PageReference saveAccount() {
       // if (validateFields()) {
            try {
                insert newAccount;
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account saved successfully!'));
             //   resetFields();
            } catch (Exception e) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'An error occurred while saving the account: ' + e.getMessage()));
            }
       // }
        return null;
    }
    
    Public void SearchAccountName(){
        
        accountList = New List<Account>();
        
        string a = '%' + s + '%';
        
        accountList = [select id, Name from Account Where Name like : a order by Name Asc ];
        system.debug('name is === ' +accountList);
        for(Account acc : accountList){
            system.debug('name is === ' +acc.Name);
        }
        
    }
    
    
   
    
  
    
}