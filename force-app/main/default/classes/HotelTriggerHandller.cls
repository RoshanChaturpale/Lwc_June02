public class HotelTriggerHandller {
    
    public static void BeforeInsertMethod(List<Hotel__c> hlist){
        
        system.debug('im in before insert method');
        if(!hlist.isEmpty()){
            system.debug('list is not empty');
            system.debug('hotel list size=' +hlist.size());
            For(Hotel__c h : hlist){
                system.debug('h===' +h);
                if(h.Country__c != 'INDIA'){
                    h.Country__c.addError('we cant save country other than india..');
                }
                
                if(string.isBlank(h.Hotel_Mail_Id__c)){
                    h.Hotel_Mail_Id__c.addError('Email is not blank');
                }
                
               if(h.Hotel_Type__c == '7 Star' || h.Hotel_Type__c == '5 Star'){
                    h.Parking_Available__c = true;
                    h.Restaurent_Available__c = true;
                }
               
                /*
                if(h.Hotel_Type__c != '5 Star' || h.Hotel_Type__c != '7 Star'){
                    //h.Parking_Available__c = false;
                    //h.Restaurent_Available__c = false;
                     h.addError('Parking & Restaurent is Available for 5 star and 7 star hotel..');
                }
                */
              
            }
        }
       
    }
    
    Public static void AfterInsertMethodUsingList(List<Hotel__c> hlist){
        
        system.debug('Im in after insert method of handller class..');
        List<Room__c> rooms = new List<Room__c>();
        if(!hlist.isEmpty()){
            system.debug('the list is not empty');
            FOR(Hotel__c h : hlist){
                system.debug('h===' +h);
                Room__c room = new Room__c();
                room.Hotel_Id__c = h.Id;
                room.Room_Charge__c = 1200;
                room.Bed_Type__c = 'Single Bed';
                room.Floor_No__c = '2';
                rooms.add(room);
                
            }
            if(!rooms.isEmpty()){
                Insert rooms;
            }
        }
   
            
        
    }
    
    Public static void AfterInsertUsingMap(Map<id, Hotel__c> NewMapHotelRecord){
        
        system.debug('Im in AfterInsertUsingMap Method');
        system.debug('NewMapHotelRecord' +NewMapHotelRecord.size());
        system.debug('AfterInsertUsingMap===' +NewMapHotelRecord);
        For(Hotel__c h : NewMapHotelRecord.values()){
            
        }
    }
     
}