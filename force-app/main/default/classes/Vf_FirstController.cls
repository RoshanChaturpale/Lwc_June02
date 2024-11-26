public class Vf_FirstController {
    
    Public integer a{get;set;}
    Public integer b{get;set;}
    public integer Result{get;set;}
    
    Public void Addition(){
        
     
            
            Result = a + b ; 
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Confirm, 'Operation Completed Successfully.'));
            
        
        
    }
    Public void Subtraction(){
        Result = a - b ; 
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Confirm, 'Operation Completed Successfully.'));
    }
    Public void Multiplication(){
        Result = a * b ;
        ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Confirm, 'Operation Completed Successfully.'));
    }
    Public void Division(){
        if(b > 0){
            Result = a / b ;
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Confirm, 'Operation Completed Successfully.'));
        }
        else
        {
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Warning, 'Second Number Should be always greaterthan Zero.')); 
        }
    }
}