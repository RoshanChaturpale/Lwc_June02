public class VF_Controller3 {
    
    
    Public string RecId{get;set;}
    Public string S{get;set;}
    public list<Account> AccountList{get;set;}
    Public List<Contact> contacts{get;set;}
    Public List<Opportunity> opportunities{get;set;}
    
    
    Public void SearchAccount(){
        
        AccountList = New List<Account>();
        
        if(S!=null && S!=''){
            string a = '%' + S + '%';
            
            AccountList = [select id, Name , Rating, CreatedById from Account where Name like : a];
            contacts=null;
            opportunities=null;
        }
     
    }
    Public void RelatedContactOrOpportunity(){
        
        contacts = [Select id, FirstName,LastName From Contact where AccountId =: RecId];
        opportunities = [Select id, Name , StageName, CloseDate from Opportunity where AccountId =: RecId];
        
    }

}