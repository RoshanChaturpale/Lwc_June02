@isTest
public class AccountTriggerHandlerTest {
    
    @testSetup
    public static void testSetUpMethod(){
        
        Test.StartTest();
     
        For(integer i=1;i<=10; i++){
        
        Account acc = new Account();
        acc.Name = 'Hari'+i;
        acc.Industry = 'Energy';
        acc.Account_Email__c = 'R@gmail.com';
        acc.Account_Phone__c = '4578457845';    
        //system.debug('acc Name is ==' +acc.Name);
        //system.debug('acc Rating is ==' +acc.Rating);
        
       insert acc;
        }
        
      
        
        Test.StopTest();
        
    }
    
    @isTest
    Public static void beforeInsertUpdate_Test(){
        
        test.startTest();
        Account acc = [select id, Name , Rating from Account where Name = 'Hari' limit 1];
        Test.stopTest();
        
        system.debug('acc Name is === ' +acc.Name);
        system.debug('acc Rating is  === ' +acc.Rating);
        
        
        
        
    }

}