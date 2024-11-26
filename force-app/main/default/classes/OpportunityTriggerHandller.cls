public class OpportunityTriggerHandller {
    
 
public static void UpdateDescription(List<Opportunity> opplist){
        
        FOR(Opportunity opp : opplist){
            if( opp.Amount!= Null && opp.Amount >= 10000 && opp.Amount  <= 50000){
                opp.Description = 'Hot Opportunity';
                
            }
        }
         
    } 
    
public static void PopulateLatestOppAmt(List<Opportunity> opplist){
        
        List<Account> acclist = New List<Account>();
        
        For(Opportunity opp : opplist){
            
            Account acc = New Account();
            acc.id = opp.AccountId;
            acc.Latest_Opp_Amount__c = opp.Amount;
            acclist.add(acc);
        }
        if(!acclist.isEmpty()){
            update acclist;
        }
        
    }
    
    
Public static void TotalOpportunitiesAndTotalAmount(List<Opportunity> opplist,List<Opportunity> oldOppList){
        
        List<Account> Accounts = new List<Account>();
        set<id> setids = New Set<id>();
    
        if(opplist != null){ 
            for(Opportunity opp : opplist){
                setids.add(opp.AccountId);
            } 
        }
        
    
        if (oldOppList != null){
            for(Opportunity opp : oldOppList){
                setids.add(opp.AccountId);
            }
        }

      List<Account> acclist = [SELECT Id, Total_opportunities__c, Total_Amount__c, Minimum_opp__c, Maximum_opp__c,(SELECT Id, AccountId, Amount FROM Opportunities) FROM Account WHERE Id IN :setids];

      for (Account acc : acclist) {
          if (acc.Opportunities != null) {
          acc.Total_opportunities__c = acc.Opportunities.size();
              
              
            Decimal sum = 0;
            Decimal minAmount = 0;
            Decimal maxAmount = 0;
        
           //Decimal sum = 0;
         for (Opportunity opp : acc.Opportunities) {
            if (opp.Amount != null) {
              sum = sum + opp.Amount;
                
                if (minAmount == null || opp.Amount < minAmount) {
                        minAmount = opp.Amount;
                    }
                if (maxAmount == null || opp.Amount > maxAmount) {
                        maxAmount = opp.Amount;
                    }
            }
        }
        acc.Total_Amount__c = sum;
        acc.Minimum_opp__c = minAmount;
        acc.Maximum_opp__c = maxAmount;
        Accounts.add(acc);
          }
      }

     if (!Accounts.isEmpty()) {
          update Accounts;
      }
}
    
    
// 3. Update Account Rating to 'Hot 'on account when opportunity stage equals 'closed one' 
Public static void updateAccountRating(List<Opportunity> opplist){
        List<Account> accounts = new List<Account>();
        Set<ID> setids =  new Set<ID>();
        FOR(Opportunity opp : opplist){
            if(opp.StageName == 'Closed Won'){
                setids.add(opp.AccountId);
            }
         }
        List<Account> accList = [select id, Rating FROM Account where id IN : setids];
        if(accList != Null){
            For(Account acc : accList){
            acc.Rating = 'Hot';
            accounts.add(acc);
        }     
      }
    Update accounts;
    }     
    
    
 /* Write a Salesforce trigger that sends an email notification to the account owner
   when a new opportunity is created with a value greater than $10,000.  */
     
public static void sendEmailNotification(List<Opportunity> newOpportunities) {
        
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        
        for (Opportunity opp : newOpportunities) {
            if (opp.Amount > 10000 && opp.Account.Owner.Email != null) {
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setToAddresses(new List<String>{ opp.Account.Owner.Email });
                email.setSubject('New Opportunity Alert');
                email.setPlainTextBody('A new opportunity with a value greater than $10,000 has been created.');
                emails.add(email);
            }
        }
        
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }    
     

    
    Public static void metho1(List<Opportunity> oppList){
        
        
        List<Account> accList = new List<Account>();
        Set<id> setids = new Set<id>();
        For(Opportunity opp : oppList){
            if(opp.StageName == ''){
                setids.add(opp.AccountId); 
            }
        }
        
        List<Account> accountList = [Select id, Name,Description From Account where Id IN : setids];
        
        
        For(Account acc : accountList){
            if(acc.id != null){
                acc.Description = '';
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            Update accList;
        }
}  
    
    
 /* Whenever an Opportunity an 'Closed Won'  , Create a Task for the Opportunity Owner to split the revenue among the team with high priority */   
    Public static void OpptoTask(List<Opportunity> opplist){
        
        List<Task> createTask = new List<Task>();
        
        For(Opportunity opp : oppList){
            if(opp.StageName == 'Closed Won'){
                
                Task taskRecord = new Task();
                taskRecord.Priority = 'High';
                taskRecord.OwnerId =opp.OwnerId;
                taskRecord.Description = 'Please split the revenue amongst to the team';
                taskRecord.Subject = 'Split revenue';
                taskRecord.Status = 'Not Started';
                taskRecord.WhatId = opp.Id;
                createTask.add(taskRecord); 
            }
        }
        
        If(!createTask.isEmpty()){
            insert createTask;
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}