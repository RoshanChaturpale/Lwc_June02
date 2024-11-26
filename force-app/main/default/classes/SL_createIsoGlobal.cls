public class SL_createIsoGlobal {
    
    Lead leads;
    //Vaariable Declaration
    Public string name{set;get;}
    public string ISO{set;get;}
    public string firstname{set;get;}
    public string lastname{set;get;}
    public decimal mobile{set;get;}
    public string email{set;get;}
    public string company{set;get;}
    public string ssn{set;get;}
    public string address{set;get;}
    public string city{set;get;}
    public string state{set;get;}
    public string ZipCode{set;get;}
    public string howKnowUs{set;get;}
    
    public string preApprovedNoates{set;get;}
    public string whatOtherFilesWereSubmitted{set;get;}
    
    public boolean bridgeFinancing{set;get;}
    public boolean businessCreditCard{set;get;}
    public boolean linesOfCredit{set;get;}
    public boolean personalLoans{set;get;}
    public boolean equipementFinance{set;get;}
    public boolean debtSettlement{set;get;}
    public boolean heloc{set;get;}
    public boolean personalCreditCards{set;get;}
    public boolean residentialMortgage{set;get;}
    public boolean commercialMortgage{set;get;}
    public boolean debtMitigation{set;get;}
    public boolean businessLoan{set;get;}
    
     /* File upload filename and filebody*/
    public transient string fileName {get;set;}
    public transient string ptaFile {get;set;}
    public transient Blob ptaBody {get;set;}
    public transient Blob fileBody {get;set;}
    public transient string btaFile {get;set;}
    public transient Blob btaBody {get;set;}
    public transient string otherFile {get;set;}
    public transient Blob otherBody {get;set;}
    public transient integer otherFileSize {get;set;}
    
    
    
    
    Public list<String> isoProducts;
    
    
    
        public ContentVersion createContentVersion(string fileName,Blob fileBody,string title){
        ContentVersion conVer = new ContentVersion();
        system.debug('conVer '+conVer);
        conVer.ContentLocation = 'S'; // to use S specify this document is in Salesforce, to use E for external files
        conVer.PathOnClient = fileName; // The files name, extension is very important here which will help the file in preview.
        conVer.Title = title; // Display name of the files
        conVer.VersionData = fileBody; 
        
        return conVer;
    }
    
    // Upload files/attachments on the lead record
    public PageReference UploadFile(string parentId) {
        system.debug('filecalled');
        PageReference pr;
        List<ContentVersion> ContentVersionList = new List<ContentVersion>();
        List<ContentDocumentLink> ContentDocumentLinkList = new List<ContentDocumentLink>();
        
        if(fileName != null ) {
            if(fileBody != null && fileBody.size() > 0){
                system.debug('inside if');
            ContentVersionList.add(createContentVersion(fileName,fileBody,'Credit Report'));   
            }else{
                ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.Error,'Please upload non empty Credit Report file.');
            	Apexpages.addMessage(msg);
            }
        }
        
        if(ptaFile != null){ 
        if(ptaBody != null && ptaBody.size() > 0) {
            ContentVersionList.add(createContentVersion(ptaFile,ptaBody,'Personal Tax Returns'));            
        }else{
                ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.Error,'Please upload non empty Personal Tax Returns file.');
            	Apexpages.addMessage(msg);
            }
        }
        
        if(btaFile != null){
            if(btaBody != null && btaBody.size() > 0) {
            ContentVersionList.add(createContentVersion(btaFile,btaBody,'Business Tax Returns'));            
        }else{
                ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.Error,'Please upload non empty Business Tax Returns file.');
            	Apexpages.addMessage(msg);
            }
        }
       
        if(otherFile != null){ 
            if(otherBody != null && otherBody.size() > 0 /*&& otherFileSize < 3000*/) {
            ContentVersionList.add(createContentVersion(otherFile,otherBody,'Other'));
        }else{
                ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.Error,'Please upload non empty Other file or check file size.');
            	Apexpages.addMessage(msg);
            }
        }
        if(ContentVersionList.size() > 0){
            insert ContentVersionList;
        }
        system.debug('ContentVersionList '+ContentVersionList);
        
        Map<Id,ContentVersion> mapContentVersion = new Map<Id,ContentVersion>();
        system.debug('mapContentVersion '+mapContentVersion);
        mapContentVersion.putAll(ContentVersionList);
        system.debug('mapContentVersion '+mapContentVersion);
        
        if(!ContentVersionList.isEmpty()){
            for(ContentVersion conver : [SELECT ContentDocumentId FROM ContentVersion WHERE Id IN :mapContentVersion.keyset()]){
                ContentDocumentLink conDocLink = New ContentDocumentLink();
                conDocLink.LinkedEntityId = parentId; // Lead Id 
                conDocLink.ContentDocumentId = conver.ContentDocumentId;  //ContentDocumentId Id from ContentVersion
                conDocLink.shareType = 'V';  
                ContentDocumentLinkList.add(conDocLink);
            }
            if(ContentDocumentLinkList.size() > 0){
                insert ContentDocumentLinkList;
                system.debug('ContentDocumentLinkList '+ContentDocumentLinkList);
            }
        }
        return null;
    }
    
    
    Public void addISOProducts(){
        
        isoProducts = new List<String>();
        if(businessCreditCard == true){
            isoProducts.add('Business Credit Card');
        }
        if(linesOfCredit == true){
            isoProducts.add('Business Lines of Credit');            
        }
        if(personalLoans == true){
            isoProducts.add('Personal Loan');            
        }
        if(equipementFinance == true){
            isoProducts.add('Equipment Finance');
        }
        if(debtSettlement == true){
            isoProducts.add('Debt Settlement');            
        }
        if(heloc == true){
            isoProducts.add('HELOC');
        }
        if(personalCreditCards == true){
            isoProducts.add('Personal Credit Cards');            
        }
        if(residentialMortgage == true){
            isoProducts.add('Residential Mortgage');            
        }
        if(commercialMortgage == true){
            isoProducts.add('Commercial Mortgage');            
        }
        if(debtMitigation == true){
            isoProducts.add('Debt Mitigation');
        }
        if(businessLoan == true){
            isoProducts.add('Business Term Loan');
        }
        
        
        if(isoProducts.size() > 0){
            createISOGlobal(isoProducts);
        }
        
    }
    
    Public PageReference createIsoGlobal(List<string> isoProducts){
       
        try{
            leads = new Lead();
            leads.FirstName = firstname;
            leads.LastName = lastname;
            leads.MobilePhone = String.Valueof(mobile);
            leads.Email = email;
            leads.Company = company;
            leads.LeadSource = 'ISO';
            leads.Pre_Approval_Notes__c = preApprovedNoates;
            leads.What_Other_Files_Were_Submitted__c = whatOtherFilesWereSubmitted;
            leads.Products__c = String.join(isoProducts, ' ;');
            leads.Bridge_Financing__c = bridgeFinancing;
            
            Insert leads;
            
            if(leads != null && leads.Id != null){
                UploadFile(leads.Id);
            }
            
             ResetObjects();
            
             return Page.SL_ISOLeadCreation;
            
        }catch(exception e){
            
             ApexPages.Message msg=new ApexPages.Message(Apexpages.Severity.Error,'Insertion Failed');
            system.debug('Error: '+e);
            Apexpages.addMessage(msg);
            //ResetObjects();
            return null;
            
           
            
        }
        
        
    }
    
    // Reset the veriables on the class
    private void ResetObjects() {
        leads = new lead(); 
        name = null;
        firstName = null;
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
        heloc = null;
        personalCreditCards = null;
        residentialMortgage = null;
        commercialMortgage = null;
        personalLoans = null;
       // creditReport = null;
      //  onlyZeroApr = null;
       // nonZero = null;
        debtMitigation = null;
      //  termsandCondition = null;        
        whatOtherFilesWereSubmitted = null;
        howKnowUs = null;
      //  fileName = null;
      //  ptaFile = null;
      //  btaFile = null;
      //  otherFile = null;
        
    }
    
    
    

    
}