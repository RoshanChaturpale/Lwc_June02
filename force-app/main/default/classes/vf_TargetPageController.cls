public class vf_TargetPageController {

    Public List<Account> lstAccounts{get;set;}
    
    Public vf_TargetPageController(){
        
        lstAccounts = new List<Account>();
        
        string accountName = ApexPages.CurrentPage().GetParameters().Get('name');
        
        system.debug('accountName is === ' +accountName);
        
        if(accountName!= null){
            
            accountName  += '%';
            
            lstAccounts = [select id, Name From Account where Name like : accountName];
        }
        
    }
    
    
    
 Public PageReference GotoSourcePage(){
   
     PageReference pgRef = new PageReference('/apex/vf_SourcePageController');
     pgRef.SetRedirect(true);
 
     return pgRef;
}
    }