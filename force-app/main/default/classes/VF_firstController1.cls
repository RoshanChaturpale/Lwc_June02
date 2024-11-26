public class VF_firstController1 {
    
    Public string a{get;set;}
    Public List<Account> accountlist{get;set;}
    
    Public void SearchAccount(){
        
        accountlist = New List<Account>();
        
        if(a!=null && a!=''){
            
            String searchTerm = '%'+a+'%';
            accountlist = [Select id, Name, Phone_Code__c from Account where Name like : searchTerm ];
            
        }
        else{
            ApexPages.AddMessage(New ApexPages.Message(ApexPages.Severity.INFO , 'Record is Not Found...'));
        }
        
        
        
    }
}