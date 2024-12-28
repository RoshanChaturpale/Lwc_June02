public class createPDF_ABAgreement {
    
    
    /*
    public Opportunity opp {set;get;}
    public Double payment4{get;set;}
    public paymentWrapperObj payment1 {set;get;}
    public paymentWrapperObj payment2 {set;get;}
    public paymentWrapperObj payment3 {set;get;}
    public maturedPaymentWrapper fundingDates {set;get;}
    
    
    public createPDF_ABAgreement(){
        opp = new Opportunity();
        String id = ApexPages.currentPage().getParameters().get('id');
        opp = [select id,name,AccountId,Account.Latest_Funding_Date__c,Account.name,Account.FirstName,Account.LastName,Account.IspersonAccount,Account.PersonMailingStreet,Account.PersonMailingCity,Account.PersonMailingState,Account.PersonMailingPostalCode,Account.Phone,Account.PersonEmail,
               CC_Loan_Number__c,Funding_Date__c,Lead_Referred_To__r.Lender_License__c,Lead_Referred_To__r.Name,Lead_Referred_To__r.BillingStreet,Lead_Referred_To__r.BillingCity,Lead_Referred_To__r.BillingState,Lead_Referred_To__r.BillingPostalCode,Lead_Referred_To__r.Phone,Lead_Referred_To__r.PersonEmail,Lead_Referred_To__r.Default_Interest_Rate__c,
               Lead_Referred_To__r.NSF_Fee__c,Principal_Loan_Amount__c,Funding_Type__c,Lead_Referred_To__r.Partner_Email__c, Payment_Amount_1__c,Payment_Amount_2__c,Payment_Amount_3__c,Term_Days__c,Due_Date_3__c,Due_Date_2__c,Due_Date_1__c,Payday_APR__c,Admin_Fee_per_100__c,Cost_of_Borrowing__c,Total_Cost_of_Borrowing__c , Net_Pay__c,Payday_Max_Loan_Amount__c,Bank_Name__c,Bank_Account_Number__c,Bank_Account__c from opportunity where id=:id];
        
        List<Opportunity> oppRecords = [SELECT Id, Name, Funding_Date__c FROM Opportunity WHERE AccountId =: opp.AccountId AND StageName = 'Matured Loan'];
        fundingDates = new maturedPaymentWrapper();
        
        if(!oppRecords.isEmpty()){
            for(Opportunity oppObj : oppRecords){
                if(String.isNotBlank(fundingDates.MaturedFundingDates)){
                    fundingDates.MaturedFundingDates = fundingDates.MaturedFundingDates + ', ' + (oppObj.Funding_Date__c).year() + '-' + (oppObj.Funding_Date__c).month() + '-' + (oppObj.Funding_Date__c).day();
                }else{
                    fundingDates.MaturedFundingDates = (oppObj.Funding_Date__c).year() + '-' + (oppObj.Funding_Date__c).month() + '-' + (oppObj.Funding_Date__c).day();
                }
            }
        }
        
        List<Payments__c> payments = [SELECT Id, Name, Payment_Amount_1__c, Payment_Method_1__c, Due_Date_1__c, Payment_Status_1__c, Payment_Reminder_1__c, Opportunity__c FROM Payments__c WHERE Opportunity__c =: id ORDER BY CreatedDate DESC];
                
        if(!payments.isEmpty()){
            payment1 = new paymentWrapperObj();
            payment2 = new paymentWrapperObj();
            payment3 = new paymentWrapperObj();
            if(!payments.isEmpty() && payments.size() > 0){
                payment1.paymentAmount1 = commaSeparator(payments[0].Payment_Amount_1__c);
                payment1.dueDate1 = payments[0].Due_Date_1__c.year() + '-' + payments[0].Due_Date_1__c.month() + '-' + payments[0].Due_Date_1__c.day();
            }
            if(!payments.isEmpty() && payments.size() > 1){
                payment2.paymentAmount1 = commaSeparator(payments[1].Payment_Amount_1__c);
                payment2.dueDate1 = payments[1].Due_Date_1__c.year() + '-' + payments[1].Due_Date_1__c.month() + '-' + payments[1].Due_Date_1__c.day();
            }
            if(!payments.isEmpty() && payments.size() > 2){
                payment3.paymentAmount1 = commaSeparator(payments[2].Payment_Amount_1__c);
                payment3.dueDate1 = payments[2].Due_Date_1__c.year() + '-' + payments[2].Due_Date_1__c.month() + '-' + payments[2].Due_Date_1__c.day();
            }
        }
    }
    
    public static String commaSeparator(Decimal decimalNum){
        String s;
        List<String> args = new String[]{'0','number','###,###,##0.00'};
            if(decimalNum != null && decimalNum != 0){
                s = String.format(decimalNum.format(), args);
                if(s.containsAny('.') && s.substringAfter('.').length() == 1){
                    s = s+'0';
                }
                if(!s.containsAny('.')){
                    s = s+'.00';
                }
            }
        else{
            s = '0.00';
        }
        return s;
    }
    
    public class maturedPaymentWrapper{
        public String MaturedFundingDates{set;get;}
    }
    
    public class paymentWrapperObj{
        public String paymentAmount1{set;get;}
        public String dueDate1{set;get;}
    }


*/

}


/*

===========================================================
vf page name --- GeneratePDF_ABAgreement
=====================================================================
<apex:page  renderAs="pdf" standardStylesheets="true">
    

    <div style="position: absolute;top: 0;">
        
         <div>
             
              <td style="width:246.25pt;padding:0cm 0cm 0cm 0cm; text-align:left; ">
                  
               <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Name&nbsp;:&nbsp; <!--- <apex:outputField value="{!opp.Lead_Referred_To__r.Name}"/>   --> </span></p>
               <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Date&nbsp;:&nbsp; <!--- <apex:outputField value="{!opp.}"/>   --> </span></p>
                <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Licence&nbsp;:&nbsp; <!--- <apex:outputField value="{!opp.Funding_Date__c}"/>  --></span></p>
               </td>
                
                  
            </div>
        
        
         <br/>
             
        
        
        <div align="center">
            
           
            
            <div align="center" style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
            <table style="width:100%;border-collapse:collapse;border: 1px solid black; text-align: left;">
                <tbody>
                    <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:20px; text-align: center;">COST OF BORROWING NOTICE</span></strong></p>
                        </td>
                    </tr>
                    
                     <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><span style="font-size:15px; text-align: center;">Payday loans are a form of high-cost credit</span></p>
                        </td>
                    </tr>
                    
                    
                     <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:12px; text-align: center;">        <br/>                                                                         </span></strong></p>
                        </td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td style="width: 45.74%;padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Amount of loan</span></p>
                        </td>
                        <td style="width: 54.26%;padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$  <!--- <apex:outputField value="{!${opp.Principal_Loan_Amount__c}}"/>   --> </span></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Total Fees and Interest</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp; <!--- <apex:outputField value="{!${opp.Cost_of_Borrowing__c}}"/>   --> Days  </span></p>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width: 45.74%;padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;&nbsp;Rate per $100 borrowed <br/>&nbsp;(legal maximum of $15)</span></p>
                        </td>
                        <td style="width: 54.26%;padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$ <!--- <apex:outputField value="{${opp.Admin_Fee_per_100__c}}"/>  --> </span></p>
                        </td>
                    </tr>
                    
                     <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:12px; text-align: center;">        <br/>                                                                         </span></strong></p>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Annual Percentage Rate</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp; <!--- <apex:outputField value="{!opp.Payday_APR__c}"/>  --> </span></p>
                        </td>
                    </tr>
                    
                     <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:12px; text-align: center;">        <br/>                                                                         </span></strong></p>
                        </td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Total Amount to be paid</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp; <!--- <apex:outputField value="{!{${opp.Total_Cost_of_Borrowing__c}}"/>  --> </span></p>
                        </td>
                    </tr>
                    
                     <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:12px; text-align: center;">        <br/>                                                                         </span></strong></p>
                        </td>
                    </tr>
                    
                    
                     <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Payment Schedule</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$ <!--- {!${opp.Payment_Amount_1__c}}</span><span style="font-size:12px;">&nbsp;{!opp.Due_Date_1__c}   <br/> &nbsp;{!${opp.Payment_Amount_2__c}}</span><span style="font-size:12px;">&nbsp;{!opp.Due_Date_2__c}  <br/> &nbsp; {!${opp.Payment_Amount_3__c}}</span><span style="font-size:12px;">&nbsp;{!opp.Due_Date_3__c} --></span></p>
                        </td>
                    </tr>
                    
                      <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:12px; text-align: center;">        <br/>                                                                         </span></strong></p>
                        </td>
                    </tr>
                    
                    
                    
                     <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Dishonoured Payment Fee</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$ <!--- {!${opp.Lead_Referred_To__r.NSF_Fee__c}}  --> </span></p>
                        </td>
                    </tr>
                    
                    <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:12px; text-align: center;">        <br/>                                                                         </span></strong></p>
                        </td>
                    </tr>
                    
                    <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:15px;">&nbsp;You can prepay this loan in full or in part at any time without any charge or penalty. </span></p>
                        </td>
                    </tr>
                    
                     <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:12px; text-align: center;">        <br/>                                                                         </span></strong></p>
                        </td>
                    </tr>
                    
                    
                     <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:15px;">&nbsp;You cannot be forced to make scheduled payments before a payment is due under the credit agreement. </span></p>
                        </td>
                    </tr>
                    
                     <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:12px; text-align: center;">        <br/>                                                                         </span></strong></p>
                        </td>
                    </tr>
                    
                    <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:15px;">&nbsp;You can cancel this loan within two business days at no cost by repaying the amount of the loan. </span></p>   
                        </td>
                    </tr>
                    
                     <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:12px; text-align: center;">        <br/>                                                                         </span></strong></p>
                        </td>
                    </tr>
                    
                    
                    <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:15px;">&nbsp;For more information on your rights and protections, <a href="https://www.alberta.ca" target="_blank">www.alberta.ca.</a> </span></p>   
                        </td>
                    </tr>
                    
                    

                    
                   
                </tbody>
            </table>
        </div>
        
            
        </div>
        
        
        
        <br/><br/>
        <br/>
        
        
        <br/><br/>
        <br/>
        
        
        <br/>
        <br/>
        <br/>
        
          <br/>
          <br/>
        
      
        
        
   
        
        
        

        
        
        
        
        <div align="center">
            
            <table style="width:100%;border-collapse:collapse;border: 1px solid black; text-align: left;">
                <tbody>
                    <tr>
                        <td style="width:100%;padding:0cm 0cm 0cm 0cm;">
                            
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><u><span style="font-size:20px;">LOAN AGREEMENT AND DISCLOSURE STATEMENT</span></u></strong></p>
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><u><span style="font-size:12px;"><span style="text-decoration:none;">&nbsp;</span></span></u></strong></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;padding:0cm 0cm 0cm 0cm;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:8.0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>&nbsp;</p>
                            <table style="width:100%;border: none;border-collapse:collapse;">
                                <tbody>
                                    <tr>
                                        <td style="width:246.25pt;padding:0cm 0cm 0cm 0cm; text-align:left; ">
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">LOAN AGREEMENT NUMBER: &nbsp;:&nbsp;<!--  <apex:outputField value="{!opp.CC_Loan_Number__c}"/>  ---> </span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">LOAN AGREEMENT DATE: &nbsp;:&nbsp;  <!--  <apex:outputField value="{!opp.Funding_Date__c}"/> -->   </span></p>
                                        </td>
                                        <td style="width:410.4pt;padding:0cm 0cm 0cm 0cm;">
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        </td>
                                        <!--<td style="width:164.15pt;padding:0cm 0cm 0cm 0cm;">
<p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Date:</span></p>
</td>-->
                                    </tr>
                                </tbody>
                            </table>
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span>&nbsp;</span></p>
                            <table style="border-collapse: collapse; text-align: left; line-height:1.25rem;width:100%">
                                
                                <!--style="border-collapse:collapse;border: 1px solid black;">-->
                                <tbody>
                                    <tr style="border-collapse:collapse;border: 1px solid black;">
                                        <td style="width: 233.75pt;border: 1pt solid windowtext;padding: 0cm 5.4pt;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Lender/Licensee</span></p>
                                        </td>
                                        <td style="width: 233.75pt;border-top: 1pt solid windowtext;border-right: 1pt solid windowtext;border-bottom: 1pt solid windowtext;border-image: initial;border-left: none;padding: 0cm 5.4pt;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Borrower</span></p>
                                        </td>
                                    </tr>
                                    
                                    <tr style="border-collapse:collapse;border: 1px solid black;">
                                        <td style="width: 233.75pt;border-right: 1pt solid windowtext;border-bottom: 1pt solid windowtext;border-left: 1pt solid windowtext;border-image: initial;border-top: none;padding: 0cm 5.4pt;vertical-align: top;  border: 1px solid black; border-collapse: collapse;">
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">License#:&nbsp;&nbsp;<!--- <apex:outputField value="{!opp.Lead_Referred_To__r.Lender_License__c}"/>  --></span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Name:&nbsp;&nbsp;<!--- <apex:outputField value="{!opp.Lead_Referred_To__r.Name}"/>  --> </span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Street:&nbsp;&nbsp;<!--- <apex:outputField value="{!opp.Lead_Referred_To__r.BillingStreet}"/>  --> </span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">City, Province Postal Code:&nbsp;&nbsp;<!--- <apex:outputField value="{!opp.Lead_Referred_To__r.BillingCity}"/>&nbsp;<apex:outputField value="{!opp.Lead_Referred_To__r.BillingState}"/>&nbsp;<apex:outputField value="{!opp.Lead_Referred_To__r.BillingPostalCode}"/>  --> </span></p>
                                            
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Tel#:&nbsp;&nbsp; <!---  <apex:outputField value="{!opp.Lead_Referred_To__r.Phone}"/>  --->  </span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Email:&nbsp;&nbsp; <!--- <apex:outputField value="{!opp.Lead_Referred_To__r.Partner_Email__c}"/>   ---> </span></p>
                                        </td>
                                        <td style="width: 233.75pt;border-top: none;border-left: none;border-bottom: 1pt solid windowtext;border-right: 1pt solid windowtext;padding: 0cm 5.4pt;vertical-align: top;  border: 1px solid black;
                                                   border-collapse: collapse;">
                                            
                                            
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Name:&nbsp;&nbsp; <!--- <apex:outputField value="{!opp.Account.name}"/>&nbsp;<apex:outputField value="{!opp.Account.name}"/>  ---> </span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Street:&nbsp;&nbsp; <!--- <apex:outputField value="{!opp.Account.PersonMailingCity}"/>  ---> </span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">City, Province Postal Code:&nbsp;&nbsp; <!--- <apex:outputField value="{!opp.Account.PersonMailingCity}"/>&nbsp;<apex:outputField value="{!opp.Account.PersonMailingState}"/>&nbsp;<apex:outputField value="{!opp.Account.PersonMailingPostalCode}"/>  ---> </span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Cell Phone:&nbsp;&nbsp; <!--- <apex:outputField value="{!opp.Account.Phone}"/>  ---> </span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Home Phone:&nbsp;&nbsp; <!--- <apex:outputField value="{!opp.Account.Home_Phone__c}"/>  ---> </span></p>
                                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Email:&nbsp;&nbsp; <!--- <apex:outputField value="{!opp.Account.PersonEmail}"/>  ---> </span></p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                        </td>
                    </tr>
                </tbody>
            </table>
            
        </div>
        
            
    
    
    
    
    
    


     <div align="center" style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
            <table style="width:100%;border-collapse:collapse;border: 1px solid black; text-align: left;">
                <tbody>
                    <tr style="border-collapse:collapse;border: 1px solid black;">
                        <td colspan="2" style="padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;text-align:center;'><strong><span style="font-size:15px; text-align: center;">Details of Payday Loan Agreement</span></strong></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 45.74%;padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Principal&nbsp;Amount Borrowed</span></p>
                        </td>
                        <td style="width: 54.26%;padding: 0cm;vertical-align: top;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$ <!--- <apex:outputField value="{!opp.Principal_Loan_Amount__c}"/>  --> </span></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Term of the Agreement in Days</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp; <!--- <apex:outputField value="{!opp.Term_Days__c}"/>   --> Days  </span></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Cost of Credit / APR Rate</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$<!--- <apex:outputField value="{!opp.Cost_of_Borrowing__c}"/>  <p> / </p>&nbsp;<apex:outputField value="{!opp.Payday_APR__c}"/>--> </span></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Maximum Allowable Cost per $100 Borrowed</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;<!--- <apex:outputField value="{!opp.}"/> Per $100 Borrowed   --> </span></p>
                        </td>
                    </tr>

                    
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Cost per $100 Borrowed</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$ <!--- <apex:outputField value="{!opp.Admin_Fee_per_100__c}"/> per $100 Borrowed --> </span></p>
                        </td>
                    </tr>

                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Payment #1: Amount Due and Date</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$ <!--- {!opp.Payment_Amount_1__c}</span><span style="font-size:12px;">&nbsp;{!opp.Due_Date_1__c}  --> </span></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Payment #2: Amount and Due Date</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$ <!--- {!opp.Payment_Amount_2__c} </span><span style="font-size:12px;">&nbsp;{!opp.Due_Date_2__c} --> </span></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Payment #3: Amount and Due Date</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;$ <!--- {!opp.Payment_Amount_3__c} </span><span style="font-size:12px;">&nbsp;{!opp.Due_Date_3__c} --> </span></p>
                        </td>
                    </tr>
                   
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Date of Loan Advance</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp; <!--- <apex:outputField value="{!opp.Funding_Date__c}"/>  --> </span></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:45.74%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Default Interest Rate</span></p>
                        </td>
                        <td style="width:54.26%;padding:0cm 0cm 0cm 0cm;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp; <!---  <apex:outputField value="{!opp.Lead_Referred_To__r.Default_Interest_Rate__c}"/>  --> </span></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 45.74%;padding: 0cm;height: 30pt;vertical-align: bottom;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;Borrower&apos;s Signature</span></p>
                        </td>
                        <td style="width: 54.26%;padding: 0cm;height: 30pt;vertical-align: bottom;border-collapse:collapse;border: 1px solid black; padding-left: 2px; padding-right: 2px;">
                            <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:  normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
            <b>TERM OF LOAN: </b> This loan agreement ensures that the instalment plan allows you, the borrower, to repay the loan over a period of at least 42 days and no more than 62 days 
                                  regardless of any other term stated in this payday loan agreement. 
                                  This term is as determined by {opp.Lead_Referred_To__r.xyz}, the lender, based on the frequency of income used to approve the borrower for the loan.
        </p>
    </div>
        
        
        
      <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
          <p>
              <b>INTEREST: </b> Interest is applied to only the principal amount borrowed.
          </p>
        </div>  
        
        
        
      
      <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
          <p>
              <b>EARLY PAYOFF: : </b> The borrower is entitled to prepay the entire outstanding balance at any time without penalty and is entitled to make partial prepayments without penalty on any scheduled payment date;
          </p>
        </div>
        
        
       <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
          <p>
              <b>YOUR CANCELLATION RIGHTS:: </b> You may cancel this agreement, without any reason no later than the end of the second day after the lender gives a copy of the agreement to the borrower. To cancel this agreement, 
                                                 you must complete the form available on our website via form entitled “Loan Cancelation Request” OR provide the lender notice in writing,  
                                                 signed by the borrower, of the borrower’s intention to cancel the payday loan agreement. The borrower may also provide this cancelation request via email to the email address shown on the first page of this agreement.
                                                 You do not have to give a reason for cancelation.
                                                 The request to cancel will be processed if payment of the principal amount borrowed is received by {opp.Lead_Referred_To__r.xyz} within the two (2) business days of receiving a copy of the agreement from the lender. 
                                                 You will receive via (e)mail a “Confirmation of Cancelation” once the cancelation has been processed.
             
              <br/> <br/>
              
                                                If you are not provided with the loan or with a copy of this agreement that complies with Consumer Protection Act of Alberta you enter into the agreement, 
                                                 you may cancel the agreement at any time.
              
              <br/> <br/>
              
                                                To cancel the agreement, you must provide your notice of cancellation, together with the amount you borrowed, 
                                                to {opp.Lead_Referred_To__r.xyz} If you have made any payments under the loan,
                                                {opp.Lead_Referred_To__r.xyz} must return those payments to you at the earliest reasonable opportunity.
             
          </p>
             
             <div style="text-align: right;">
              <span style="display: inline-block; width: 75px; height: 75px; border: 1px solid black; vertical-align: initial; margin-left: 10px;"></span>
                <span style="white-space: nowrap; margin-left: 5px; vertical-align: middle;">Borrower’s Initials</span>
               </div>
            
        </div>
        
       
        
        <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
            <b>AGREEMENT: </b>  You promise to pay {opp.Lead_Referred_To__r.xyz}. the amount set out above as the total Repayable in accordance with the above payment schedule. As a result, 
                                {opp.Lead_Referred_To__r.xyz} hereby gives you ${opp.Principal_Loan_Amount__c} in the form of {opp.Funding_Type__c}.
        </p>
    </div>
        
        
        
       
        <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
            <b>COPY OF AGREEMENT:  </b> The borrower is entitled to receive a copy of the agreement by requesting it at any time before the end of two years from the end of the term of the agreement from 
                                         {opp.Lead_Referred_To__r.xyz}. 
                                        if no loan broker has assisted the borrower in obtaining the payday loan.
        </p>
    </div>
        
        
        <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
            <b>TRUTH OF APPLICATION: </b>  You certify that the information stated on this Loan Agreement is true and correct.
                                          You also warrant and guarantee that you are not a debtor under any proceedings in bankruptcy,
                                          insolvency reorganization and have no intention to file or will not file and/or petition for relief 
                                         under any chapter, section or subsection of the Canadian Bankruptcy and Insolvency Act, during this Loan Agreement.
                                         You understand that if any of this information is incorrect,
                                         {opp.Lead_Referred_To__r.xyz}. 
                                         will continue to act against you to recover any outstanding debt. You also waive any defence you may have to 
                                         such action under the Bankruptcy and Insolvency Act should you already be a party to any insolvency proceedings 
                                         prior to the date you enter into this loan agreement. You understand that we are processing the approval based on 
                                         the validity of the application and this Loan Agreement. You authorize us to verify any information given by you to 
                                         {opp.Lead_Referred_To__r.xyz}. The Borrower agrees to notify
                                          {opp.Lead_Referred_To__r.xyz} if there is any change in his or her employment or bank account status.
        </p>
    </div>
                
       
         <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
            <b> METHOD OF PAYMENT: </b> You hereby authorize
                                        {opp.Lead_Referred_To__r.xyz}. 
                                       to process your payment on or after the due date stipulated in this Agreement via pre-authorized debit.
                                       The Borrower will repay this loan either instore by cash/debit or electronically via pre-authorized debit 
                                       or email money transfer.
        </p>
    </div>
        
        
       
         <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
            <b>LATE CHARGES: </b> If you don't pay the entire balance due on or by the Due Date of this Loan Agreement,
                                 daily interest charges will accrue at a rate of 30% per annum until the amount due is paid in full. 
                                 Interest will only be applied to the principal amount borrowed. All payments received will be applied first to any 
                                 returned cheque charges and then additional interest charges, then to the legal fees, then to the cost of borrowing 
                                 fees and then unpaid principal balance of your Loan Agreement. 
                                 {opp.Lead_Referred_To__r.xyz} 
                                  is not permitted to charge you any amount that is not disclosed in this Agreement.
        </p>
    </div>
        
        
      <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
            <b>DEFAULT: </b>  You will be in default under this Loan Agreement if (a) you stop payment on a cheque or otherwise fail to pay the Total of Payment on or before the Due Date stated on this Loan Agreement, or (b) you provide false or misleading information about yourself, your employment or your financial condition prior to entering this Loan Agreement.
        </p>
    </div>
        
        
        
       <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
             <b>GOOD OR SERVICES:  </b> The supply of other goods or services is separate and optional.
        </p>
           
           <div style="text-align: right;">
              <span style="display: inline-block; width: 75px; height: 75px; border: 1px solid black; vertical-align: initial; margin-left: 10px;"></span>
                <span style="white-space: nowrap; margin-left: 5px; vertical-align: middle;">Borrower’s Initials</span>
               </div>
           
           
    </div>
        

    
   
        <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
             <b>ELEECTRONIC COMMUNICATION:  </b>  The lender will provide a copy of the full payday loan agreement and any required accompanying documentation by e‑mail sent to the address provided by the borrower for that purpose, or by other electronic means.
        </p>
           
           <div style="text-align: right;">
              <span style="display: inline-block; width: 75px; height: 75px; border: 1px solid black; vertical-align: initial; margin-left: 10px;"></span>
                <span style="white-space: nowrap; margin-left: 5px; vertical-align: middle;">Borrower’s Initials</span>
               </div>
        </div>
        
        
        
        
        
         <div style='margin-top:0cm;margin-right:0cm;margin-bottom:0pt;margin-left:0cm;line-height:107%;font-size:15px;font-family:"Calibri",sans-serif;'>
        <p>
             <b>  NON-PAYMENT CHARGES:  </b> If your payment for this Loan Agreement and applicable interest and fees are not paid in full by the due date,
                                             your cheque is returned due to your account being closed, or insufficient funds, or if you stopped the payment
                                             on your cheque a one-time late payment charge of 
                                             ${opp.Lead_Referred_To__r.NSF_Fee__c}  
                                             may apply. If the loan and applicable interest and fees are not paid in full, 
                                             we will also look to recover any legal fees associated with the enforcement of the Loan Agreement through a court judgment.
        
            <br/> <br/>
            
                                            By signing this Agreement, you acknowledge that this agreement was filled in before you signed and that you
                                            have received a full copy. Further that, you acknowledge that you have read it, understand it and that you 
                                            agree to all the terms.
          
            <br/> <br/>
            
                                            The Borrower hereby authorizes {opp.Lead_Referred_To__r.xyz} to withdraw from the borrower’s current
                                            bank account numbered 
                                            {opp.Bank_Account__c} at the {opp.Bank_Name__c} 
                                            or any other bank account held in the borrower’s name, the sum of 
                                            ${opp.Total_Cost_of_Borrowing__c} on or after the Due Date as stipulated in this loan agreement.
        
             <br/> <br/>
            
                                            By signing this agreement, the Borrower acknowledges the following:
            
              <br/> <br/> 
                                            1.  You have read and received a copy of this payday loan agreement.  <br/> <br/> 
                                            2.	We reviewed with you the total cost of credit and APR for your payday loan and the process you must take to cancel your loan. <br/> <br/> 
                                            3.	You agree to all the terms of this agreement and consent to the collection, use and disclosure of your personal information.
       
            
         </p>
             
             
           
           <div style="text-align: right;">
              <span style="display: inline-block; width: 75px; height: 75px; border: 1px solid black; vertical-align: initial; margin-left: 10px;"></span>
                <span style="white-space: nowrap; margin-left: 5px; vertical-align: middle;">Borrower’s Initials</span>
               </div>
             
              <br/> <br/>
        </div>
        
        
        
        

        
        
        
        
        
        
        <table style="border: none;width:96.0%;border-collapse:collapse;">
            <tbody>
                <tr>
                    <td style="padding: 0cm;height: 18.75pt;vertical-align: top;">
                        <p style='margin-top:15.0pt;margin-right:0cm;margin-bottom:  15.0pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Executed at the city of&nbsp; <!--- <apex:outputField value="{!opp.Account.PersonMailingCity}"/>, <apex:outputField value="{!opp.Account.PersonMailingState}"/>&nbsp;on&nbsp;<apex:outputField value="{!opp.Funding_Date__c}"/>.  --> </span></p>
                        <table style="border-collapse:collapse;border:none;">
                            <tbody>
                                <tr>
                                    <td style="width: 224.4pt;border: 1pt solid #000;padding: 0cm 5.4pt;vertical-align: top;">
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">__________________________________</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Borrower</span></p>
                                    </td>
                                    <td style="width: 224.4pt;border-top: 1pt solid #000;border-right: 1pt solid #000;border-bottom: 1pt solid #000;border-image: initial;border-left: none;padding: 0cm 5.4pt;vertical-align: top;">
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">____________________________________</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Lender</span></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        
        
        
        <div>
            <p>
                
                  For value received, the undersigned promises to pay to
                  {opp.Lead_Referred_To__r.xyz} 
                   or any subsequent holder of this promissory note, on the due date, noted above, the sum of
                  ${opp.Total_Cost_of_Borrowing__c}.
                  The undersigned hereby waives any grace period and waives presentment of payment, notice to dishonor, notice
                  of non-payment, protest, and any and all other notices and demands in connection with the delivery, acceptance,
                  performance, default or enforcement of this promissory note.
                
            </p>
        </div>
        
       <br/> <br/>  <br/> <br/>

        
        <table style="border: none;width:96.0%;border-collapse:collapse;">
            <tbody>
                <tr>
                    
                    <td style="padding: 0cm;height: 18.75pt;vertical-align: top;">
                        <p style='margin-top:15.0pt;margin-right:0cm;margin-bottom:  15.0pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Executed and affirmed before me at the city of {opp.Account.PersonMailingCity}, {opp.personaccount} on {opp.Funding_Date__c}. </span></p>
                        <table style="border-collapse:collapse;border:none;">
                            <tbody>
                                <tr>
                                    <td style="width: 224.4pt;border: 1pt solid #000;padding: 0cm 5.4pt;vertical-align: top;">
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">__________________________________</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Borrower</span></p>
                                    </td>
                                    <td style="width: 224.4pt;border-top: 1pt solid #000;border-right: 1pt solid #000;border-bottom: 1pt solid #000;border-image: initial;border-left: none;padding: 0cm 5.4pt;vertical-align: top;">
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">&nbsp;</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">____________________________________</span></p>
                                        <p style='margin-top:0cm;margin-right:0cm;margin-bottom:.0001pt;margin-left:0cm;line-height:normal;font-size:15px;font-family:"Calibri",sans-serif;'><span style="font-size:12px;">Lender</span></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
      
    </div>
                                            
             */