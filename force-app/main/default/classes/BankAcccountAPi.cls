@RestResource(urlMapping='/api/banking/accounts/')
Global class BankAcccountAPi {
    
    
    
    public class AccountWrapper{
        
        public string AccountNumber;
        Public string CustomerName;
        Public Decimal AccountBalance;
        Public String AccountStatus;
        Public String AccountType;
        
        Public AccountWrapper(Bank_Account__c acc){
            
            this.AccountNumber= acc.Name;
            this.CustomerName = acc.Customer_Name__c;
            this.AccountBalance = acc.Account_Balance__c;
            this.AccountStatus = acc.Account_Status__c;
            this.AccountType = acc.Account_Type__c;
            
        }
    }
    
    Public class TransactionRequest{
        Public string AccountId;
        Public Decimal TransactionAmount;
        Public string TransactionType;
        public String Description;
    }
    
    @HttpGet
    Global static string getAccountData(){
        
        try {
            // Extract Account ID from the URL
            RestRequest req = RestContext.request;
            String accountId = req.requestURI.substringAfter('/api/banking/accounts/');

            // Query Account details
            Bank_Account__c accounts = [
                SELECT Id, Name, Customer_Name__c, Account_Balance__c, 
                       Account_Status__c, Account_Type__c
                FROM Bank_Account__c
             //  WHERE Id = :accountId
             // LIMIT 1
            ];

            // Wrap and return account data
            AccountWrapper accountData = new AccountWrapper(accounts);
            return JSON.serialize(accountData);
            
             /* Convert the list of SObjects into the wrapper class
            List<AccountWrapper> accountData = new List<AccountWrapper>();
            for(Bank_Account__c acc : accounts) {
                accountData.add(new AccountWrapper(acc));
            }
            
            // Return serialized JSON response
            return JSON.serialize(accountData);

               */


        } catch (Exception e) {
            RestContext.response.statusCode = 500;
            return JSON.serialize('Error: ' + e.getMessage());
        }
        
    }
    
    @httpPost
    Global static string PostTransactions(){
        
        RestRequest req = RestContext.Request;
        String requestBody = req.requestBody.toString();
        
        
        TransactionRequest trans = (TransactionRequest) JSON.deserialize(requestBody , TransactionRequest.class);
        
        Bank_Account__c account = [Select id, Account_Balance__c from Bank_Account__c where id =: trans.AccountId];
        
        
        // Update Account Balance
            Decimal updatedBalance = account.Account_Balance__c;
        
        if(trans.TransactionType == 'Credit'){
           updatedBalance= updatedBalance + trans.TransactionAmount;
        }else if(trans.TransactionType == 'Debit'){
            If(account.Account_Balance__c >= trans.TransactionAmount){
              updatedBalance = updatedBalance - trans.TransactionAmount;
            }
        }
        
        Transaction__c newTransaction = new Transaction__c();
            newTransaction.Bank_Account__c = account.Id;
            newTransaction.Transaction_Amount__c = trans.TransactionAmount;
            newTransaction.Transaction_Type__c = trans.TransactionType;
            newTransaction.Transaction_Date__c = DateTime.now();
            newTransaction.Description__c = trans.Description;
            insert newTransaction;

            // Update the account balance
            account.Account_Balance__c = updatedBalance;
            update account;

            return JSON.serialize('Transaction Successful. New Balance: ' + updatedBalance);

        
        
        
        
        
        
    }

}