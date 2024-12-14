Public with sharing class AccountPersonOppAPI {
 /*   
    @InvocableMethod(label='Wrapper_With_AccountPersonOppAPI' description='Wrapper class with Opportunity, Person, Business Custom Api  ')
    Public static void getAccountPersonOppData(List<id> recordIds) {
  
        try {
            
            system.debug('recordIds===============>>>>>>>>>>>>>>' +recordIds);
 
            String recordId = recordIds[0];            
            // Query the Opportunity record
            Opportunity opp = [SELECT Id, Name, Amount, StageName, CloseDate, CC_Loan_Number__c,Funding_Date__c, Lead_Referred_To__r.Lender_License__c,Lead_Referred_To__r.Name,
                               Lead_Referred_To__r.BillingStreet,Lead_Referred_To__r.BillingCity,Lead_Referred_To__r.BillingState,Lead_Referred_To__r.BillingPostalCode,
                               Lead_Referred_To__r.Phone,Lead_Referred_To__r.PersonEmail,
                               Account.PersonMailingStreet,Account.PersonMailingCity,Account.PersonMailingPostalCode,
                               Account.Phone,Account.PersonEmail, Account.Name,
                               Principal_Loan_Amount__c,Term_Days__c,
                               Total_Cost_of_Borrowing__c,Admin_Fee_per_100__c,Payday_APR__c,
                               Payment_Amount_1__c,Payment_Amount_2__c,Payment_Amount_3__c,Due_Date_3__c,Due_Date_2__c,Due_Date_1__c,
                               Lead_Referred_To__r.Default_Interest_Rate__c,
                               Net_Pay__c,Payday_Max_Loan_Amount__c,
                               Bank_Account__c,Bank_Name__c, Funding_Type__c,Cost_of_Borrowing__c
                               FROM Opportunity  WHERE Id =: recordId
                               LIMIT 1]; // Modify query as needed
            
            system.debug('Opp name is ===' +opp.Name);
                        system.debug('Opp name is ===' +opp.Amount);

            
            // Query the Person Account record
            Account personAcc = [SELECT FirstName, LastName, Email__c,Phone, PersonMailingStreet,PersonMailingCity,PersonMailingCountry,PersonMailingState, Name , BillingPostalCode , PersonMailingPostalCode from Account
                                 WHERE Id =: opp.AccountId limit 1]; // Modify query as needed

            
            // Query the Business Account record
            Account businessAcc = [SELECT FirstName, LastName, Partner_Email__c, Phone, Company_Name__c ,Default_Interest_Rate__c,NSF_Fee__c, BillingCity, BillingCountry, BillingStreet, Lender_License__c, MaximumAllowableCost__c, Name , BillingPostalCode , PersonMailingPostalCode From Account 
                                    WHERE Id =: opp.Lead_Referred_To__c  LIMIT 1]; 
            
 
            // Create an instance of the combined wrapper and populate the fields
  
            CombinedWrapper wrapper = new CombinedWrapper();
        
            
           // Populate Person Account fields
           wrapper.Person_First_Name = personAcc.Name;
           wrapper.Person_Last_Name = personAcc.LastName;
           wrapper.Person_Email = personAcc.Email__c;
           wrapper.Person_Phone = personAcc.Phone;
           wrapper.Person_MailingStreet = personAcc.PersonMailingStreet;
           wrapper.Person_MailingCity = personAcc.PersonMailingCity;
           wrapper.Person_MailingCountry = personAcc.PersonMailingCountry;
           wrapper.Person_MailingProvince = personAcc.PersonMailingState;
           wrapper.Person_BillingPostalCode = personAcc.BillingPostalCode;
            
           // Populate Business Account fields
           wrapper.Business_First_Name = businessAcc.FirstName;
           wrapper.Business_Last_Name = businessAcc.LastName;
           wrapper.Business_PartnerEmail = businessAcc.Partner_Email__c;
           wrapper.Business_DefaultInterestRate = businessAcc.Default_Interest_Rate__c;
           wrapper.Business_NSFFee = businessAcc.NSF_Fee__c;
           wrapper.Business_Phone = businessAcc.Phone;
           wrapper.Business_Company_Name = businessAcc.Company_Name__c;
           wrapper.Business_BillingCity = businessAcc.BillingCity;
           wrapper.Business_BillingCountry = businessAcc.BillingCountry;
           wrapper.Business_BillingStreet = businessAcc.BillingStreet;
           wrapper.Business_MailingPostalCode = businessAcc.PersonMailingPostalCode;
        
           //businessAccWrapper.billingProvince = businessAcc.billingp;
           wrapper.Business_LicenseNumber = businessAcc.Lender_License__c;
           wrapper.Business_MaxAllowableCost = businessAcc.MaximumAllowableCost__c;
           

            

          // Populate Opportunity fields
          wrapper.Opportunity_Name = opp.Name;
          wrapper.Opportunity_Amount = opp.Amount;
          wrapper.Opportunity_Stage = opp.StageName;
          wrapper.Opportunity_CloseDate = opp.CloseDate;
          wrapper.Opportunity_CC_Loan_Number = opp.CC_Loan_Number__c;
          wrapper.Opportunity_Funding_Date = opp.Funding_Date__c;
          wrapper.Opportunity_Principal_Loan_Amount = opp.Principal_Loan_Amount__c;
          wrapper.Opportunity_Term_Day = opp.Term_Days__c;
          wrapper.Opportunity_Total_Cost_of_Borrowing = opp.Total_Cost_of_Borrowing__c;
          wrapper.Opportunity_Admin_Fee_per_100 = opp.Admin_Fee_per_100__c;
          wrapper.Opportunity_Payday_Apr = opp.Payday_APR__c;
          wrapper.Opportunity_Payment_Amount_1 = opp.Payment_Amount_1__c;
          wrapper.Opportunity_Payment_Amount_2 = opp.Payment_Amount_2__c;
          wrapper.Opportunity_Payment_Amount_3 = opp.Payment_Amount_3__c;
          wrapper.Opportunity_Due_Date_1 = opp.Due_Date_1__c; 
          wrapper.Opportunity_Due_Date_2 = opp.Due_Date_2__c;
          wrapper.Opportunity_Due_Date_3 = opp.Due_Date_3__c;
          wrapper.Opportunity_Net_Pay = opp.Net_Pay__c;
          wrapper.Opportunity_Payday_Max_Loan_Amount = opp.Payday_Max_Loan_Amount__c;
          wrapper.Opportunity_Bank_Account = opp.Bank_Account__c;
          wrapper.Opportunity_Bank_Name = opp.Bank_Name__c;   
          wrapper.Opportunity_Cost_of_Borrowing = opp.Cost_of_Borrowing__c;
          wrapper.Opportunity_Funding_Type = opp.Funding_Type__c;


          system.debug('Combined Wrapper Data: ' + JSON.serialize(wrapper));

          // Serialize the combined wrapper object into JSON and return it
          // return JSON.serialize(wrapper);
           
          String jsonBody = JSON.serialize(wrapper);
            
          system.debug('jsonBody============>' +jsonBody.toString());

          //Make Http Callouts
          HttpRequest req = new HttpRequest();
          req.setEndpoint('https://hooks.zapier.com/hooks/catch/12204369/36sh9tu/');
          req.setMethod('POST');
          req.setHeader('Content-Type', 'application/json');
          req.setBody(jsonBody);
        
          Http http = new Http();
          HttpResponse res = http.send(req);
        
          System.debug('res is ====>>>>>' +res.getBody());
            
            if(res.getStatusCode() == 200){
                System.debug('Request sent successfully: ' + res.getBody());
            }
            else{
                System.debug('Failed with status: ' + res.getStatus() + ' and body: ' + res.getBody());
            }
        
        }catch(Exception e){
            System.debug('Error: ' + e.getMessage());
            System.debug('Error:');
        }
    }
    
    
// Define a single wrapper for all fields from Business Account, Person Account, and Opportunity
Public Class CombinedWrapper {
        
        // Person Account fields
        public String Person_First_Name;
        public String Person_Last_Name;
        public String Person_Email;
        public String Person_Phone;
        public String Person_MailingStreet;
        public String Person_MailingCity;
        public String Person_MailingCountry;
        public String Person_MailingProvince;
    
        public String Person_BillingPostalCode;
       
        // Business Account fields
        public String Business_First_Name;
        public String Business_Last_Name;
        public String Business_PartnerEmail;
        public Decimal Business_DefaultInterestRate;
        public Decimal Business_NSFFee;
        public String Business_Phone;
        public String Business_Company_Name;
        public String Business_BillingCity;
        public String Business_BillingCountry;
        public String Business_BillingStreet;
        public String Business_BillingProvince;
        public String Business_LicenseNumber;
        public Decimal Business_MaxAllowableCost;
    
        public String Business_MailingPostalCode;
        
       //opportunity 
        public String Opportunity_Name;
        public Decimal Opportunity_Amount;
        public String Opportunity_Stage;
        public Date Opportunity_CloseDate;
        public String Opportunity_CC_Loan_Number;  
        public Date Opportunity_Funding_Date;     
        public Decimal Opportunity_Principal_Loan_Amount;  
        public Decimal Opportunity_Term_Day;        
        public Decimal Opportunity_Total_Cost_of_Borrowing;
        public Decimal Opportunity_Admin_Fee_per_100;  
        public Decimal Opportunity_Payday_Apr;     
        public Decimal Opportunity_Payment_Amount_1;
        public Decimal Opportunity_Payment_Amount_2;
        public Decimal Opportunity_Payment_Amount_3;
        public Date Opportunity_Due_Date_1;
        public Date Opportunity_Due_Date_2;
        public Date Opportunity_Due_Date_3;
        public Decimal Opportunity_Net_Pay; 
        public Decimal Opportunity_Payday_Max_Loan_Amount; 
        Public Decimal Opportunity_Bank_Account;
        Public String Opportunity_Bank_Name;  
        public Decimal Opportunity_Cost_of_Borrowing;  
        Public String Opportunity_Funding_Type;
    
    }*/

}