@isTest
public class apexPage_Validataion_Test {

    @isTest
    Public static void testSetupData(){
        
        apexPage_Validataion c = new apexPage_Validataion();
        c.firstname = 'test_Name';
        c.lastname = 'test_LastName';
        c.company = 'test_company';
        c.mobile = 1212121012;
        c.termsandCondition = true;
        
        
        c.createLead();
        
        Lead lead = [select FirstName, LastName, Company from Lead where FirstName = 'test_Name'];
        system.debug('lead is == ' +lead);
    }
}