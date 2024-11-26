@isTest
public class apexPage_Validataion_Test {
    
    @isTest
    Public static void createLead_Test(){
        
        test.startTest();
        
        apexPage_Validataion c = new apexPage_Validataion();
        c.firstname = 'firstName';
        c.lastname = 'lastName';
        c.mobile = 1231235421;
        c.email = 'email121@gmail.com';
        c.company = 'Company';
        c.termsandCondition = true;
        
        c.createLead();
        
        test.stopTest();
        
        Lead leads = [select LastName, MobilePhone, Email from Lead where LastName = 'firstName' limit 1];
        
        System.debug('Lead : '+leads);
        system.debug('LastName is === >' +leads.LastName);
        
        system.assertEquals('firstName', leads.LastName);
        system.assertEquals('1231235421',leads.MobilePhone);
        system.assertEquals('email121@gmail.com', leads.Email);
        
    }

}