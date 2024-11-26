@isTest
public class SL_createIsoGlobal_Test {
    
    @isTest
    Public static void addISOProducts_Test(){
        
        test.startTest();
        
        // for Products
        SL_createIsoGlobal controller = new SL_createIsoGlobal();
        controller.businessCreditCard = true;
        controller.linesOfCredit  = true;
        controller.personalLoans = true;
        controller.equipementFinance = true;
        controller.debtSettlement = true;
        controller.heloc = true;
        controller.personalCreditCards = true;
        controller.residentialMortgage = true;
        controller.commercialMortgage = true;
        controller.debtMitigation  = true;
        controller.businessLoan = true;
        controller.bridgeFinancing = true;
        
        
        controller.firstname = 'firstname';
        controller.lastname = 'lastname';
        controller.mobile = 1235465210;
        controller.company = 'company';
        controller.email = 'email@email.com';
        
        controller.addISOProducts();
        
        Lead lead = [select Products__c from Lead where firstname = 'firstname'];
        
        system.debug('lead is ====---++ ' +lead);
         
        
        
    }
    
    

}