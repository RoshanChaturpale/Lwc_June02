public class SL_createPreApprovalLeadCntr {
    
    Lead leads;
    public string name{set;get;}
    //public string ISO{set;get;}
    //public string firstName{set;get;}
    public string lastName{set;get;}   
    public decimal mobile{set;get { return (mobile == 0) ? null : mobile; }}
    public string email{set;get;}
    public string company{set;get;}
    public string ssn{set;get;}
    public string address{set;get;}
    public string city{set;get;}
    public string state{set;get;}
    public string zipCode{set;get;}
    public string howKnowUs{set;get;}
    public string preApprovedNoates{set;get;}
    public boolean bridgeFinancing{set;get;}
    public boolean businessCreditCard{set;get;}
    public boolean linesOfCredit{set;get;}
    public boolean equipementFinance{set;get;}
    public boolean debtSettlement{set;get;}
    public boolean personalLoans{set;get;}
    public boolean businessLoan{set;get;}
    public boolean personalCreditCards{set;get;}
    public boolean creditReport{set;get;}
    public boolean onlyZeroApr{set;get;}
    public boolean nonZero {set;get;}
    public boolean heloc{set;get;}
    public boolean residentialMortage{set;get;}
    public boolean commercialMortage{set;get;}
    public boolean debtMitigation{set;get;}
    public boolean termsandCondition {set; get;}
    Public List<string> serviceProducts;
    
    
    
   
    
    @testVisible
    public static boolean isTestRun = false;
    
    // Pre approval products
    Public PageReference addserviceProducts(){ 
        System.debug('Service start :');
        serviceProducts = new List<string>();
        if(personalCreditCards == true){
            serviceProducts.add('Personal Credit Cards');
        }  
        if(heloc == true){
            serviceProducts.add('HELOC');
        }
        if(residentialMortage == true){
            serviceProducts.add('Residential Mortgage');
        }  
        if(commercialMortage == true){
            serviceProducts.add('Commercial Mortgage');
        }  
        if(equipementFinance == true){
            serviceProducts.add('Equipment Finance');
        }  
        if(businessCreditCard == true){
            serviceProducts.add('Business Credit Cards');
        }  
        if(debtMitigation == true){  
            serviceProducts.add('Debt Mitigation');
        }  
        if(linesOfCredit == true){   
            serviceProducts.add('Business Lines of Credit');
        }   
        if(businessLoan == true){  
            serviceProducts.add('Business Term Loan');
        }       
        if(debtSettlement == true){
            serviceProducts.add('Debt Settlement');
        }       
        if(personalLoans == true){
            serviceProducts.add('Personal Loan');            
        }
        System.debug('Service end :'+serviceProducts);
        if(serviceProducts.size() > 0){
            
            createService(serviceProducts);
        }
        else{
            ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.Error,'Select minimum one product, Excluding Bridge Financing');
            Apexpages.addMessage(msg);
            return null;
        }
        return null;
    }
    
    /* Create Pre Approval Lead */
    public PageReference createService(List<string> serviceProducts){
        String leadFirstName;
        String leadLastName;
        
        try{
            if(isTestRun && Test.isRunningTest()){ throw new AuraHandledException('This is for Test');}
            String leadName = name;
            String[] words = leadName.split(' ',2);
            
            if(words.size()>1){
                leadFirstName = words[0];
                leadLastName = words[1];
                System.debug(leadFirstName+'-'+LeadLastName);
            }else{
                leadLastName = words[0];
            }
            
            leads = new Lead();   
            leads.Products__c = String.join(serviceProducts,' ;');
            leads.FirstName = leadFirstName;
            leads.LastName = leadLastName;
            leads.MobilePhone = String.valueOf(mobile);
            leads.Company = company ;
            leads.Email = email;
            leads.City = city;
            leads.State = state;
            leads.PostalCode = zipCode;
            leads.SSN__c = ssn;
            leads.Street = address;
            leads.LeadSource = 'Pre Approval';  
            leads.How_you_got_to_know_us__c = howKnowUs;
            leads.Bridge_Financing__c = bridgeFinancing;
            
            System.debug('Lead : '+leads);
            insert leads;
            ResetObjects();
            
        }catch(Exception e){
            System.debug('exception: '+e.getMessage());
            ApexPages.Message msg=new ApexPages.Message(Apexpages.Severity.Error,'Insertion Failed');
            Apexpages.addMessage(msg);
            return null;
        }
        servicesRequested();
        return null;
    }
    
    
    // Reset the veriables on the class
    private void ResetObjects() {
        leads = new lead(); 
        name = null;
        //firstName = null;
        lastName  = null; 
        mobile = null;
        email = null;
        company = null;
        ssn = null;
        address = null;
        city = null;
        state = null;
        zipCode = null;
        preApprovedNoates = null;
        bridgeFinancing = null;
        businessCreditCard = null;
        businessLoan = null;
        linesOfCredit = null;
        equipementFinance = null;
        debtSettlement = null;
        personalCreditCards = null;
        personalLoans = null;
        creditReport = null;
        onlyZeroApr = null;
        nonZero = null;
        termsandCondition = null;        
        howKnowUs = null;  
        heloc = null;
        residentialMortage = null;
        commercialMortage = null;
        debtMitigation = null;
    }
    
     // Wizard Navigations 
    public PageReference servicesRequested() {
       return Page.SL_PreApprovalLeadProductSelection;
        
        
      // PageReference pgRef = new PageReference('/apex/SL_PreApprovalLeadProductSelection');
      // pgRef.SetRedirect(true);
 
      // return pgRef;
      
    }
    
    /*
    public PageReference personalInformation() {
        return Page.SL_PreApprovalLeadDetails;
    } */
}