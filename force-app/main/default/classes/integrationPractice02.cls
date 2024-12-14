public class integrationPractice02 {
    
    Public static void method1(){
        
        StaticResource  st = [Select id, Name, Body from StaticResource where Name =: 'Json_format' limit 1];
        system.debug('st data is ===> ' +st.Body.toString());
        
        
        JSONParser  parser= JSON.createParser(st.Body.toString());
        
        parser.NextToken();
        parser.NextToken();
        system.debug('  ===> ' +parser.getCurrentName());
        
        if(parser.getCurrentName() == 'status'){
            parser.NextToken();
           system.debug('Value is ===>' + parser.getText());
        }
        
        
        
     }
    
    public static void method2(){
        
        StaticResource  st = [Select id, Name, Body from StaticResource where Name =: 'Json_format' limit 1];
        system.debug('st data is ===> ' +st.Body.toString());
        
       EmployeeInfo emp = (EmployeeInfo) JSON.deserialize(st.Body.toString(),  EmployeeInfo.class);  //type casting
        
       system.debug('emp status is == >' +emp.status);
               system.debug('emp data is == >' +emp.data); 
        
        For(integrationPractice02.Employee e :  emp.data){
            system.debug('Employee_name ==> ' +e.Employee_name);
            system.debug('Employee_name ==> ' +e.Employee_salary );
            //Account acc = new Account();
            //acc.Name = e.Employee_Name;
            //insert acc;

        }

          
    }
    class EmployeeInfo{
            string status{get;set;}
            List<integrationPractice02.Employee> data{get;set;}   // or // integrationPractice02.Employee[] data{get;set;}
        }
    class Employee{
        string id{get;set;}
        string Employee_name{get;set;}
        string Employee_salary{get;set;}
        string Employee_age{get;set;}
    }
    
    
    Public static void method3(){
        
        list<Account> acclist = [select id, Name from Account];
        
        String jsonText = JSON.serialize(acclist);
        system.debug('jsonText ==> ' + jsonText);
    }
    
    
    

}