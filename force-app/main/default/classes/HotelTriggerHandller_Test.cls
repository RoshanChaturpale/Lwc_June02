@isTest
public class HotelTriggerHandller_Test {
    
    @testSetup
    Public static void TestSetupData(){
        
            test.startTest();
        
            Hotel__c h = new Hotel__c();
            h.Name = 'H-1';
            h.Country__c = 'INDIA';
            h.State__c = 'Maharashtra';
            h.City__c = 'Nagpur';
            h.Hotel_Name__c = 'Test Hotel 1234';
            h.Hotel_Address__c = 'Test Hotel Address';
            h.Hotel_Type__c = '5 Star';
            h.Total_Rooms__c = 150;
            h.Hotel_View__c = 'Island View';
            h.Hotel_Mail_Id__c = 'Test@gmail.com';
            h.Pincode__c = '440022';
            h.Hotel_Website__c = 'TestHotel.com';
            h.Hotel_Owner__c = 'roshan chaturpale';
            h.Contact_Details__c ='9999999999';
            insert h;
        
            /*Room__c room = new Room__c();
            room.Hotel_Id__c = h.Id;
            room.Room_Charge__c = 1200;
            room.Bed_Type__c = 'Single Bed';
            room.Floor_No__c = '2';
            room.Hotel_Id__c = h.id;
            insert room;*/
        
            test.stopTest();
        
    }
    @isTest
    Public static void BeforeInsertMethod_Test(){
        
        Test.startTest();
        Hotel__c hotel = [select id ,Hotel_Name__c, Parking_Available__c, Restaurent_Available__c, City__c from Hotel__c where Hotel_Name__c = 'Test Hotel 1234'];
        test.stopTest();
        
        system.assertEquals(true , hotel.Parking_Available__c );
        system.assertEquals(true , hotel.Restaurent_Available__c );
    }
    
    @isTest
    Public static void AfterInsertMethodUsingList_Test(){
        
        test.startTest();
        Hotel__c hlist = [select id , Hotel_Name__c from Hotel__c where Hotel_Name__c = 'Test Hotel 1234'];
        List<Room__c> rooms = [select id, Room_Charge__c, Hotel_Id__c from Room__c where Hotel_Id__c =: hlist.id];
        system.debug('Room_Charge__c =' +rooms[0].Room_Charge__c);
        system.debug('Room size is ==='  +rooms.size());
        
        test.stopTest();
        
        system.assertEquals(2, rooms.size());
    }

}