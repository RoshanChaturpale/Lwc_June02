public class apexPage_Validataion {
    
    Lead leads;
    
    Public string firstname{set;get;}
    public string lastname{set;get;}
    public decimal mobile{set;get { return (mobile == 0) ? null : mobile; }}
    public string email{set;get;}
    public string company{set;get;}
    public boolean termsandCondition {set; get;}
    
    
    Public  void createLead(){
        
        system.debug('im in createLead method');
        
        leads = new Lead();
        leads.FirstName = firstname;
        leads.LastName = firstname;
        leads.MobilePhone = String.valueOf(mobile);
        leads.Email = email;
        leads.Company=company;
        
        
        System.debug('Lead : '+leads);
        
        insert leads;
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Confirm, 'operation performed Successfully.'));

         
        ResetObjects();
    }
    
    
    // Reset the veriables on the class
    private void ResetObjects() {
        leads = new lead(); 
       // name = null;
        //firstName = null;
        firstname  = null; 
        mobile = null;
        email = null;
        company = null;
        termsandCondition = null;
    }
    
    
    

}