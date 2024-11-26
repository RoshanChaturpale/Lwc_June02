public class RoomTriggerHandller {
    
    //rollUp Summary with Hotel__c && Room__c
    Public Static Void Method(List<Room__c> roomList){
        
        
        List<Hotel__c> hotelList = new List<Hotel__c>();
        set<id> setIds = new Set<id>();
        For(Room__c c : roomList){
            if(c.Hotel_Id__c != null){
                setIds.add(c.Hotel_Id__c);
            }
        }
        
        List<Hotel__c> hList = [select id,Room_Minimium_Amount__c, Room_Maximum_Amount__c, Total_Room_Amount__c,(Select id, Hotel_Id__c, Room_Amount__c From Rooms__r) From Hotel__c Where id IN : setIds];
        
            For(Hotel__c h : hList){
                if(h.Rooms__r != null){
                    h.Total_Room__c = h.Rooms__r.Size();
                    
                    Decimal sum = 0;
                    Decimal minAmount = null;
                    Decimal maxAmount = null;
                    
                    For(Room__c c : h.Rooms__r){
                        if(c.Room_Amount__c != null){
                            
                            sum = sum + c.Room_Amount__c;  // sum of all amount fields related rooms amount;
                            
                            
                            if (minAmount == null || c.Room_Amount__c < minAmount) {
                                  minAmount = c.Room_Amount__c;
                            }
                            
                            if(maxAmount == null || c.Room_Amount__c > maxAmount) {
                                maxAmount = c.Room_Amount__c;
                            }
                  
                        }
                    }
                    
                    h.Total_Room_Amount__c = sum;
                    h.Room_Minimium_Amount__c = minAmount;
                    h.Room_Maximum_Amount__c = maxAmount;
                }
      
                hotelList.add(h);
            }
        
        
     if (!hotelList.isEmpty()) {
          update hotelList;
      }
        
        
    }

    
    
    
    
}