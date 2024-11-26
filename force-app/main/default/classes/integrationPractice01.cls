public class integrationPractice01 {
    
     Public static void restaurentDataWithJSONFormate(){
        
        StaticResource st = [Select id, Name, body from StaticResource where Name =: 'restaurentDataFileWithJSON' limit 1];
        //system.debug('Restaurent Data in the form of JSON Formate == ' +st.Body.toString());   
         
         
        MenuWrapper menuWrapper = (MenuWrapper) Json.deserialize(st.Body.toString(), MenuWrapper.class);
        //system.debug('emp menu === ' +menuWrapper.menu);
        //system.debug('emp menu === ' +menuWrapper.menu.foods);
        
         string a = json.serialize(menuWrapper);
         system.debug('a is ===' +a);
         
         For(integrationPractice01.foodItems fi : menuWrapper.menu.foods){
            // system.debug(fi); 
         }
    }
    
    
     public class MenuWrapper {
        public Menu menu { get; set; }
    }
   
           
    public class Menu {
       //public List<foodItems> foods { get; set; }
       //  public List<drinkItems> drinks { get; set; }
      //  OR
        List<integrationPractice01.foodItems>  foods{get;set;}
        List<integrationPractice01.drinkItems>  drinks{get;set;}
    } 
      
     
    Public class foodItems{
       Public string name{get;set;}
       Public string type{get;set;}        
    }
    
    Public class drinkItems{
       Public string name{get;set;}
       Public string type{get;set;}        
    }

}