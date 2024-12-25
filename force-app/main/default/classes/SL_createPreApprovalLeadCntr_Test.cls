@isTest
public class SL_createPreApprovalLeadCntr_Test {
    
    
    @isTest
    Public static void method1(){
        
        SL_createPreApprovalLeadCntr c = new SL_createPreApprovalLeadCntr();
        c.name = 'test_name';
        c.lastName = 'test_lastName';
        c.mobile = 1234567894;
        c.email = 'test_email@gmail.com';
        c.company = 'test_company';
        c.ssn = 'test_ssn';
        c.address = 'test_address';
        c.city = 'test_city';
        c.state = 'test_state';
        c.zipcode = 'test_zipCode';
        
        c.method1();
    }

}