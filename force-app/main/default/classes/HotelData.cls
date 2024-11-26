public class HotelData {
     @AuraEnabled(Cacheable=true)
    Public static list<Hotel__c> showHotelData(){
        
        List<Hotel__c> listOfHotels = new List<Hotel__c>();
            
            listOfHotels = [select Id, Hotel_Name__c, Hotel_Type__c from Hotel__c limit 5];
        
           return listOfHotels;
            
    }
    
    @auraEnabled(cacheable = true)
    public static List<Hotel__c> hotelDetails(String searchHotel){
        String searchKey = '%'+searchHotel+'%';
        List<Hotel__c> hlist = new list<Hotel__c>();
        hlist = [Select Id,Hotel_Name__c,Hotel_Mail_Id__c,Hotel_Owner__c,Hotel_Type__c,
                 Hotel_Website__c From Hotel__c where Hotel_Name__c LIKE : searchKey];
        return hlist;
    }
    
   
        

}