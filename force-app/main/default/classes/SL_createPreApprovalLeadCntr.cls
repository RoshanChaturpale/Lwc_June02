public class SL_createPreApprovalLeadCntr {
    
    
    Lead leads;
    
    Public string name{set;get;}
    Public string lastName{set;get;}
    Public decimal mobile{set;get {return(mobile == 0)  ? null : mobile;}}
    Public string email{set;get;}
    Public string company{set;get;}
    Public string ssn{set;get;}
    Public string address{set;get;}
    Public string city{set;get;}
    Public string state{set;get;}
    Public string zipCode{set;get;}
    
    
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
    
    
    Public List<String> serviceProducts;
    
    
    
    Public PageReference addServiceProducts(){
        
        system.debug('Service Start : ');
        
        serviceProducts = new List<String>();
        
        if(personalCreditCards ==  true){
            serviceProducts.add('Personal Credit Cards');
        }
        
        createService(serviceProducts);
        
        return null;
    }
    
   
    
    Public PageReference createService(List<string> serviceProducts){
        
        system.debug('Im in Method1');
        system.debug('Name is ===   '  +name);
        system.debug('Email is ===' +email);
        
        system.debug('Name is ===   '  +serviceProducts);
        
        resetRecords();
        
        return null;
        
        
    }
    
    public void resetRecords(){
        
        name = null;
    }
    
}