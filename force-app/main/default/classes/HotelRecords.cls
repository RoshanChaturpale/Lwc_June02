public class HotelRecords {
    
    public static void InsertMultipleRecords(){
        
        List<Hotel__c> listofHotel = new List<Hotel__c>();
        
        FOR(integer i=1; i<=50; i++){
            
            Hotel__c h = new Hotel__c();
            h.Name = 'H-' + i;
            h.Country__c = 'INDIA';
            h.State__c = 'Maharashtra';
            h.City__c = 'Nagpur';
            h.Hotel_Name__c = 'Test Hotel' +i;
            h.Hotel_Address__c = 'Test Hotel Address' +i;
            h.Hotel_Type__c = '4 Star';
            h.Total_Rooms__c = 150;
            h.Hotel_View__c = 'Island View';
            h.Hotel_Mail_Id__c = 'Test' +i+ '@gmail.com';
            h.Pincode__c = '440022';
            h.Hotel_Website__c = 'Test' +i+ 'Hotel.com';
            h.Hotel_Owner__c = 'roshan chaturpale';
            h.Contact_Details__c ='9999999999';
            listofHotel.add(h);
        }
        INSERT listofHotel;
        system.debug('sixe is==' +listofHotel.size());
    }
    
   Public static void deleteRecords(){
        
        List<Hotel__c> h = [select id from Hotel__c];
        delete h;
    }
   
   
    
   

}