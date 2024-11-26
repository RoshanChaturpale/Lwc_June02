public class vf_SourcePageController {
  
 Public string SearchText{get;set;}
    
 Public PageReference SearchAccount()
 {
 PageReference pgRef = new PageReference('/apex/vf_TargetPageController?name='+SearchText);
 pgRef.SetRedirect(true);
 
 return pgRef;
 }
}