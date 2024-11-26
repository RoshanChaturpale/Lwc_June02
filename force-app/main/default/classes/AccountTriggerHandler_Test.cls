@isTest
public class AccountTriggerHandler_Test {
    
    
    //Create TestSetUp Data
    @testSetup
    Public static void testSetupData(){
        
        test.startTest();
        
        Account acc = new Account();
        acc.Name = 'Roshan';
        acc.Industry = 'Energy';
        
        acc.CopyBillingToShipping__c = true;
        acc.BillingCity = 'billing city';
        acc.BillingCountry = 'billing country';
        acc.BillingPostalCode = '123456';
        acc.BillingState = 'billing state';
        acc.BillingStreet = 'billing street'; 
        
        acc.CreateContctWithThisCheckBox__c = true;
        acc.CreateOpportunityWithThisCheckBox__c = true;
        acc.Active__c = 'Yes';
        acc.CreateContctWithThisCheckBox__c = true;
        
        acc.Phone = '123456789';
        
        acc.Number_Of_Contacts__c = 152;
        
        acc.Industry = 'Banking';
        
        acc.check_this_box_you_can_t_delete_contact__c = true;
        
        acc.AnnualRevenue = 55000;
        
        
        
        insert acc;
        
        test.stopTest(); 
    }

    
    //Check Account Rating is Hot
     @isTest
    Public static void BeforeUpdate_Test1(){
        
        test.startTest();
        Account account = [select id, Name, Rating from Account where Name='Roshan' limit 1];
        system.debug('Account Name is=== ' +account.Name);
        system.debug('Account Rating is=== ' +account.Rating);
        test.stopTest();
        
        //Assert Condition
        system.AssertEquals('Hot' , account.Rating);
    }
    
    //Billing to Shipping
    @isTest
    Public static void BeforeUpdate_Test2(){
        
        test.startTest();
        Account account = [select id , ShippingCity from Account where Name = 'Roshan' limit 1];
        system.debug('Shipping city is== ' +account.ShippingCity);
        test.stopTest();
        
        //Assert Condition
        system.assertEquals('billing city' , account.ShippingCity);
        
    }
    
    //Check related Contact
    @isTest
    Public static void AccountToContact_Test(){
        
        Account account = [select id, Name from Account Where Name ='Roshan'];
        
        List<Contact> contact = [select id, LastName from Contact where Accountid =: account.Id];
        system.debug('contact lastName is== ' +contact[0].LastName);
        system.debug('contact size is === ' +contact.size());
     
        //Assert Condition
        system.assertEquals(contact.size() , 1);
    }
    
    
    //Check Related Opportunity
    @isTest
    Public static void CreateRelatedOpportunity_Test(){
        
        test.startTest();
        
        Account account = [select id, Name From Account Where Name = 'Roshan' limit 1];
        
        List<Opportunity> opplist = [select id, Name from Opportunity where Accountid =: account.id];
        system.debug('opplist Name is ' +opplist[0].Name);
        system.debug('opplist size is=== ' +opplist.size());
        test.stopTest();
        
        //Assert Condition
        system.assertEquals(opplist.size(), 1 );
    }
    
    /*
    //For Contact 
    @isTest
    Public static void CreateContactOrOpportunityWithCheckBox_Test(){
        
        Test.startTest();
        Account account = [select id, Name from Account where Name='Roshan' limit 1];
        
        List<Contact> contact = [select id, LastName from Contact where Accountid =: account.id];
        system.debug('contact LastName is== ' +contact[0].LastName);
        system.debug('contact size is===' +contact.size());
        test.stopTest();
        
        //Assert Condition
        system.assertEquals(contact.size(), 1);
    }
   */
    
    @isTest
    Public static void CopyPhoneAccToContact_Test(){
        
        Test.startTest();
        
        Account account = [select id, Phone from Account where Name = 'Roshan' limit 1];
        system.debug('account Phone is == ' +account.Phone);
        
        List<Contact> Conlist = new List<Contact>();
        for(Integer i=1; i<=3; i++){
            Contact con = new Contact();
            con.LastName = 'LastName' +i;
            con.AccountId = account.Id;
            Conlist.add(con);
        }
        if(!Conlist.isEmpty()){
            insert Conlist;
        }
        for (Contact con : Conlist) {
            con.Phone = account.Phone;
        }
        update Conlist;
        
        test.stopTest();
        
        List<Contact> contact = [select id, AccountId, Phone From Contact where AccountId =: account.id ];
        system.debug('contact phone is== ' +contact[0].Phone);
        
        system.assertEquals('123456789', contact[0].Phone);
        system.assertEquals('123456789', contact[1].Phone);
        system.assertEquals('123456789', contact[2].Phone);
               
    }
    
    // Insert Operation
    @isTest
    Public static void CreateContactsWithNumber_Test(){
        
        test.startTest();
        Account account = [select id, Name from Account where Name = 'Roshan' limit 1];
        system.debug('account name is=============' +account.Name);
        
        List<Contact> contact = [select id, AccountId from Contact where AccountId =: account.id];
        system.debug('contact size is ===================== ' +contact.size());
        
        test.stopTest();
        
    }
    // Update operation 
     @isTest
    Public static void CreateContactsWithNumber_Test1_Update(){
        
        test.startTest();
        Account account = [select id, Name, Number_Of_Contacts__c from Account where Name = 'Roshan' limit 1];
        account.Number_Of_Contacts__c = 10;
        update account;
        
        List<Contact> contact = [select id, AccountId from Contact where AccountId =: account.id];
        system.debug('contact size is ===================== ' +contact.size());
        
        test.stopTest();
        
    }
    
    @isTest
    Public static void CreateContactwithIndustryisBaking_Test(){
        
        Account account = [select id, Industry from Account where Name = 'Roshan' limit 1];
        system.debug('account industry is = ' +account.Industry);
        
        list<Contact> contact = [select id from Contact where AccountId =: account.Id ];
        system.debug('contact size is == ' +contact.size());
    }
   
    
    
    /*
    @isTest
    Public static void CantDeleteAccountwithCheckBox_Test(){
        
        Account account = [select id, check_this_box_you_can_t_delete_contact__c, AnnualRevenue from Account Where Name = 'Roshan' limit 1];
        delete account;
        
    }
    */
    
    
     @IsTest
    public static void testAccount(){
        RecordType recordTypeObj = [SELECT Id, Name, IsActive FROM RecordType WHERE Name = 'Person Account' LIMIT 1];
        
        Account acc = new Account();
        acc.FirstName = 'test';
        acc.LastName = 'Som';
        acc.PersonEmail = 'test@gmail.com';
        acc.Phone = '1234567890';
        acc.RecordTypeId = recordTypeObj.Id;
        insert acc;
        
        Account acc1 = new Account();
        acc1.FirstName = 'test';
        acc1.LastName = 'Som';
        acc1.PersonEmail = 'test1@gmail.com';
        acc1.Phone = '1234567890';
        acc1.RecordTypeId = recordTypeObj.Id;
        insert acc1;
        
        
       	
        Test.startTest();
        acc.FirstName = 'test2';
        update acc;
        MergeDuplicateAccountsBatch scope = new MergeDuplicateAccountsBatch();
        Database.executeBatch(scope);
        Test.stopTest();
        
    }
    
    
 

}