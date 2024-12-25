@isTest
public class SL_LeadTriggerHandler_Test {

    @testSetup
    Public static void testSetupMethod(){
        
        Lead l = new Lead();
        l.FirstName = 'roshan_test';
        l.LastName = 'lastName_test';
        l.Email = 'email01@gmail.com';
        l.Company = 'company_test';
        l.Status = 'New';
        l.LeadSource = 'ISO';
        
        insert l;
    }
    
    @isTest
    public static void doBeforeInsertUpdate_test01(){
        
        group grop = [SELECT Id,DeveloperName,Type FROM Group WHERE DeveloperName = 'Sales_Representative_Queue' and type='queue' limit 1];
        
        Lead lead = [select id, FirstName, LastName, OwnerId From Lead where Firstname = 'roshan_test' limit 1];
        system.debug('FirstName is === ' +lead.FirstName);
        system.debug('OwnerId is === ' +lead.OwnerId);
        
        system.assertEquals(lead.OwnerId, grop.id);
    }
    
    
    //New stage
    @isTest
    Public static void leadMovementTaskCreation_test01(){
        
        Map<String, SL_Lead_Task_Metadata__mdt> mapEd = SL_Lead_Task_Metadata__mdt.getAll();	
        system.debug('mapEd '+mapEd);
        
        Lead lead = [select id, Firstname, Status from Lead where FirstName = 'roshan_test' limit 1];
        
        
        Task task = [select id, Stage__c from Task Where WhoId =: lead.id];
        system.debug('Task Stage is ===>  '  +task.Stage__c);
        
        
        system.assertEquals(task.Stage__c, lead.Status);
        
        
       
        
        
        
        
    }
}