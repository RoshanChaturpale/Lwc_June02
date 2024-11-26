public class InvocableMethodwithApex_2 {
    
    @InvocableMethod(label='Update Description With Name')
    Public static List<String> Method1(List<String> str){
        
        List<String> OppString = New List<String>();
        List<Opportunity> Opplist = [select  Name From Opportunity Where Id =: str];
          
         For(Opportunity Opp : Opplist){
               OppString.add(Opp.Name);                                 
          }
        
        Return OppString;
        
    }

}