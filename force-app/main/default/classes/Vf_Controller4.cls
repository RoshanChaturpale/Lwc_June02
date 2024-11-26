public class Vf_Controller4 {
    
  //  Public List<Hotel__c> hlist{get;set;}
  
  /*  Public Vf_Controller4(){
        
        hlist = New List<Hotel__c<();
        getListHotelRec();
    } */
    
    Public Static List<Hotel__c> getListHotelRec(){
    
        return  [select id, Hotel_Name__C from Hotel__c ];
        
       // hlist = New List<Hotel__c<();
       // hlist = [select id, Hotel_Name__C from Hotel__c ];
        
    }

}