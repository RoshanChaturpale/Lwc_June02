public class vf_firstController7 {
    
   /* Public string Result{get;set;}
    
    Public void InsertAccountRec(){
        
        Account acc = new Account();
        acc.Name = 'Vf with Roshan rec';
        insert acc;
        
        if(acc.id != null){
          Result = 'Vf with Roshan rec ID is ===' +acc.id;  
        }
    }*/
    
    
  /*  Public integer a{get;set;}
     Public integer b{get;set;}
    public integer Result{get;set;}
    
    
    Public void Addition(){
        
        Result = a + b;
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Confirm, 'operation performed Successfully.'));
        system.debug('a is== ' +a);
    }
    Public void Subtraction(){
        
        Result = a - b;
    }
*/
    
    
    
 /*   Public String SearchAccountName{get;set;}
   // Public string SearchName{get;set}
    Public list<Account> lstAccount{get;set;}
    
    Public  void Method1(){
        
       String SearchName = '%' + SearchAccountName + '%';
        
        lstAccount = new List<Account>();
        
        lstAccount = [select id, Name from Account where Name like : SearchName order by Name Asc limit 10];
        for(Account acc : lstAccount){
             system.debug('lst Name is == ' +acc.Name);
        }
       
    }

    */
 
    
     Lead leads;
    public String LeadlastName { get; set; }
    public String Leadcompany { get; set; }
    public String LeadEmail { get; set; }
    public String LeadPhone { get; set; }
    
    public vf_firstController7() {
        leads = new Lead();
    }

 public void Method1() {
        /*
        if (isEmailDuplicate(LeadEmail)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Email already exists. Please use a different email.'));
            return;
        }
        
        if (isPhoneDuplicate(LeadPhone)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Phone already exists. Please use a different Phone Number.'));
            return;
        }
*/
        
        leads.LastName = LeadlastName;
        leads.Company = Leadcompany;
        leads.Email = LeadEmail;
        leads.Phone = LeadPhone;
        
        insert leads;
        
        
        // Construct and send the email with a link
        String emailBody = 'Thank you for signing up, '  +   LeadlastName + '  ! Click the link below to activate your account:\n\n';
        emailBody += 'hi --- ' + LeadEmail;

        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] { LeadEmail });
        mail.setSubject('SignIn Successfully...');
        mail.setPlainTextBody(emailBody);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        ResetObjects();

        // Redirect user to a success page or show a confirmation message
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Signup successful. Check your email for activation link.'));
    }

    private void ResetObjects() {
        leads = new Lead();
        LeadlastName = null;
        Leadcompany = null;
        LeadEmail = null;
        LeadPhone = null;
    }

    private Boolean isEmailDuplicate(String LeadEmail) {
        List<Lead> existingLeads = [SELECT Id FROM Lead WHERE Email = :LeadEmail LIMIT 1];
        return !existingLeads.isEmpty();
    }
    
    private Boolean isPhoneDuplicate(String LeadPhone) {
        List<Lead> existingLeads = [SELECT Id FROM Lead WHERE Phone = :LeadPhone LIMIT 1];
        return !existingLeads.isEmpty();
    }
    
    
}