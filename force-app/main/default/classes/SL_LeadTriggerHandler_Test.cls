@isTest
public class SL_LeadTriggerHandler_Test {
    
    @testSetup
    Public static void method1(){
        
        Lead l = new Lead();
        l.FirstName = 'Rohan';
        l.LastName = 'lastName';
        l.Email = 'Email12@gmail.com';
        l.Company = '';
        l.Status = 'New'; 
        l.LeadSource = 'ISO';
        
        insert l;
        
        system.debug('iddddddddddddddddddddddddd==== ' +l.Id);
        
    }
    
    
    //Check ownerId 
    @isTest
    Public static void abc(){
        
        Lead lead = [select id, OwnerId, FirstName from Lead where FirstName = 'Rohan' limit 1];
        system.debug('lead firstName is ===>>' +lead.FirstName);
        system.debug('lead ownerId is ===>>' +lead.OwnerId);
        
        //Assert Statement
        System.assertEquals(lead.OwnerId , [SELECT Id,DeveloperName,Type FROM Group WHERE DeveloperName = 'Sales_Representative_Queue' and type='queue' limit 1].id);
        
    }
    
    
    //check Firstname and lastname with if condition
    @isTest
    Public static void Method2(){
        
        Lead lead = [select id, FirstName, LastName, Company from Lead Where FirstName = 'Rohan' limit 1 ];
        system.debug('firstname is ==> ' +lead.FirstName);
        system.debug('lastname is ===> ' +lead.LastName);
        
        system.assertEquals('Rohan lastName' , lead.Company );
    
    } 
    
    
    //check  lastname with if condition
    @isTest
    Public static void Method3(){
        
        test.startTest();
        Lead checkLastName = new Lead();
        checkLastName.LastName = 'lead1';
       insert checkLastName;
        test.stopTest();
        
        system.assertEquals('lead1' , [select id ,Company from Lead where LastName = 'lead1' limit 1].Company);
        
        
    }
    
    
    // To check "New" stage task creation flow
    @isTest
    Public static void leadMovementTaskCreation_Test(){
        
        
        test.startTest();
        
      //  List<Group> GroupId = [select Id,OwnerId,DeveloperName from Group where DeveloperName IN  ('SL_Underwriting_Queue','Sales_Representative_Queue') and Type = 'Queue'];
        
        Map<String, SL_Lead_Task_Metadata__mdt> mapEd = SL_Lead_Task_Metadata__mdt.getAll();	
        system.debug('mapEd '+mapEd);
        
        Lead lead = [select id, FirstName,  Status from Lead Where FirstName = 'Rohan' limit 1];
        
        Task task = [select id, Stage__c from Task where WhoId =: lead.Id];
        system.debug('Task Stage is ===>  '  +task.Stage__c);
        
        test.stopTest();
        
        system.assertEquals(task.Stage__c, lead.Status);
        
    }
    
    
     @isTest
    //To check "Contacted" stage task creation flow 
    Public static void leadMovementTaskCreation_Test1(){
        
        Lead lead = [select id , Status from Lead limit 1];
        system.debug('idddddddddddddddddddddddd ....>' +lead);
        List<Task> task = [select id,Stage__c from Task where WhoId =: lead.Id ];
        
        Lead l = new Lead();
        l.id = Lead.id;
        l.Status = 'Contacted';
        system.debug('status is ===' + l.Status);
        update l;
        
        //Check assert - Contacted 
        system.assertEquals(task.size() , 1);
        system.assertEquals(task[0].Stage__c , lead.Status);
        system.debug('size of task is====' + task.size());
        system.debug('Status is =========' + lead.Status);
    }
    
    
        
        
    
    
}