@isTest
public class OpportunityTriggerHandller_Test {
    
    
    @testSetup
    Public static void TestSetUpMethod(){
        
        test.startTest();
        
        Account acc = new Account();
        acc.Name = 'Ram';
        
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Roshan';
        opp.StageName = 'Prospecting';
        opp.CloseDate = system.today();
        opp.Amount = 25000;
        opp.StageName ='Closed Won';
        opp.AccountId =acc.id;
        
        insert opp;
        
        test.stopTest();
    }
    @isTest
    Public static void UpdateDescription_Test(){
        
        test.startTest();
        Opportunity opplist = [select id,Name, Description from Opportunity Where Name = 'Roshan' limit 1];
        system.debug('opplist Description is== ' +opplist.Description);
        test.stopTest();
        
            
        system.assertEquals('Hot Opportunity', opplist.Description);
            
        }
 
    @isTest
    Public static void PopulateLatestOppAmt_Test(){
        
        test.startTest(); 
        Opportunity testOpportunity = [SELECT Id, AccountId, Amount FROM Opportunity where Name='Roshan' LIMIT 1];
        Account updatedAccount = [SELECT Id, Latest_Opp_Amount__c FROM Account WHERE Id =: testOpportunity.AccountId];
        Test.stopTest();
        
        system.debug('updatedAccount== ' +updatedAccount.Latest_Opp_Amount__c); 
        system.assertEquals( 25000 , updatedAccount.Latest_Opp_Amount__c);
        
    }
    
    @isTest
    Public static void TotalOpportunitiesAndTotalAmount_Test(){
        
        List<Opportunity> opportunity = new List<Opportunity>();
        
        For(Integer i=1; i<=5; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opp' +i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opportunity.add(opp);
        }
        Insert opportunity;
        system.debug('opportunity=== ' +opportunity.size());
    }
    
    @isTest
    Public static void updateAccountRatingTest(){
        
        List<Opportunity> opplist = [select id, Name, AccountId from Opportunity where Name = 'Roshan' limit 1];
        
        List<Account> acclist = [select id, Rating From Account where id =: opplist[0].AccountId];
        
        system.debug('acclist rating values is === >>>>>>>> ' +acclist[0].Rating);
        
       // system.assertEquals('Hot', acclist[0].Rating);
        
    }
        
       
}