@isTest
public class SL_createPreApprovalLeadCntr_Test {
    
    //Create TestSetup Data
    @testSetup
    Public static void SetupTestData(){
        
        
        test.startTest();
        //custom setting
        SL_Automation_Switch__c varSwitch = new SL_Automation_Switch__c();
        varSwitch.Name = 'SL_Automation_Switch';
        varSwitch.Lead__c = true;
    
        test.stopTest();
        
 
    }
    
    //for serviceProducts and Lead Records with if 
    @isTest
    Public static void addserviceProducts_Test(){
        
        test.startTest();
        
        SL_createPreApprovalLeadCntr c = new SL_createPreApprovalLeadCntr();
        
        //Products
        c.personalCreditCards = true;
        c.heloc =true;
        c.residentialMortage = true;
        c.commercialMortage = true;
        c.equipementFinance = true;
        c.businessCreditCard = true;
        c.debtMitigation = true;
        c.linesOfCredit =true;
        c.businessLoan= true;
        c.debtSettlement= true;
        c.personalLoans=true;
        
        //Lead Data
        c.name = 'Name c';
        c.mobile = 1235645210;
        c.company = 'Company';
        c.email = 'email11@gmail.com';
        c.city = 'Nagpur';
        c.state = 'Mh';
        c.zipCode = '441302';
        c.address = 'Katol Nagpur';
        
        c.howKnowUs = 'with third party agent';
        c.bridgeFinancing = true;
        
        //Call Method
        c.addserviceProducts();
        
        test.stopTest();
        
        
        //fetch data with SOQL
        Lead leads = [select FirstName, LastName, MobilePhone, Company, Email,City, State,
                     PostalCode,How_you_got_to_know_us__c,Bridge_Financing__c,
                     Products__c from Lead  where FirstName = 'Name c'];
        
        //check debug to all data
        system.debug('Lead is ======-----> ' +leads);
        
        //assert statement
        system.assertEquals('Name', leads.FirstName);
        system.assertEquals('c', leads.LastName);
        system.assertEquals('1235645210' , leads.MobilePhone);
        system.assertEquals('Company', leads.Company);
        system.assertEquals('email11@gmail.com', leads.Email);
        system.assertEquals('Nagpur', leads.City);
        system.assertEquals('Mh', leads.State);
        system.assertEquals('441302', leads.PostalCode);
        system.assertEquals('with third party agent', leads.How_you_got_to_know_us__c);
        system.assertEquals(true, leads.Bridge_Financing__c);
        system.assertEquals('Personal Credit Cards;HELOC;Residential Mortgage;Commercial Mortgage;Equipment Finance;Business Credit Cards;Debt Mitigation;Business Lines of Credit;Business Term Loan;Debt Settlement;Personal Loan', leads.Products__c);
        //system.assertEquals(11, leads.Products__c.Size());
        
        
    }
    
    //else part with lastname
    @isTest
    Public static void addserviceProducts_Test1(){
        
        test.startTest();
        
        SL_createPreApprovalLeadCntr c = new SL_createPreApprovalLeadCntr();
        c.personalCreditCards = true;
        c.heloc =true;
        c.residentialMortage = true;
        c.commercialMortage = true;
        c.equipementFinance = true;
        c.businessCreditCard = true;
        c.debtMitigation = true;
        c.linesOfCredit =true;
        c.businessLoan= true;
        c.debtSettlement= true;
        c.personalLoans=true;
        
        
        
        
        c.name = 'Name';
        c.mobile = 1235645210;
        c.company = 'Company';
        c.email = 'email11@gmail.com';
        c.city = 'Nagpur';
        c.state = 'Mh';
        c.zipCode = '441302';
        c.address = 'Katol Nagpur';
        
        c.howKnowUs = 'with third party agent';
        c.bridgeFinancing = true;
        
        
        c.addserviceProducts();
        
        test.stopTest();
        
        Lead leads = [select LastName from Lead];
        
        system.debug('Lead is ======-----> ' +leads);
        
        system.assertEquals('Name', leads.LastName);
        
    }
    
    // Check else condition with server side error messege
       @IsTest
        Public static void AddServiceProducts_Test2(){
            
            test.startTest();
            
            SL_createPreApprovalLeadCntr cc = new SL_createPreApprovalLeadCntr();
            cc.bridgeFinancing = true;
            
            cc.addserviceProducts();
            
            test.stopTest();
            
             System.assertEquals(ApexPages.getMessages().get(0).getDetail(),'Select minimum one product, Excluding Bridge Financing'); 
            
        }
}