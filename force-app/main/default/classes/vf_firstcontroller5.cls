/*
Design a VisualForce Page to Create the New Account Records. 
1. Needs to verify the Duplicate Account Records based on the Name and Email.
2. Record should be created, if No Duplicates Found in the object.
3. Display the Error Message, if any Duplicate Records Found.
*/
public class vf_firstcontroller5 {
    
    Public Account acc{get;set;}
 
    public vf_firstcontroller5(ApexPages.StandardController controller){
      acc= (Account) controller.GetRecord(); 
     }
 
 Public void ValidateDuplicateAccounts()
 {
 //integer recordsCount = [Select count() from account where name =: acc.name];
  integer recordsCount = [Select count() from account where Account_Email__c =: acc.Account_Email__c];

 
 if(recordsCount > 0)
 {
 ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Warning, 'Duplicate Records Found with the Same Email.'));
 } 
 else
 {
 insert acc;
 ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Confirm, 'Account Record Inserted Successfully.')); 
 }
 }
}