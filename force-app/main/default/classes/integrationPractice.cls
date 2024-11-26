public class integrationPractice {
    
    //Json parser class == 
    //JSON Deserilization
    //
    //
   
    

    Public static void jsonexamle(){
        
      StaticResource st =  [select id, Name, body from StaticResource where Name =: 'Json_format' limit 1]; 
        
        system.debug('Json data from System 1 ==  ' +st.Body.toString());
        
        JSONParser p =  JSON.CreateParser(st.Body.toString());
        
        p.nextToken();    
        system.debug('' +p.getCurrentName());
        p.nextToken();   
        system.debug('' +p.getCurrentName());
        
        if(p.getCurrentName() == 'Status'){
             p.nextToken();
            system.debug(p.getText());
            
        }
        
        
          
      
    }
    
    
    Public static void jsonexamle1(){
        
       StaticResource st =  [select id, Name, body from StaticResource where Name =: 'Json_format' limit 1]; 
        
        //Json.deserialize(st.Body.toString(), EmployeeInfo.Class);
        
        EmployeeInfo emp =  (EmployeeInfo) Json.deserialize(st.Body.toString(), EmployeeInfo.Class);
        
        system.debug('info == ' +emp.status);
        system.debug('info == ' +emp.data);
        
        For(integrationPractice.Employee e : emp.data){
            system.debug('Emp Name is === ' +e.Employee_name);
            system.debug(' Emp salary is === ' +e.Employee_salary);
            
        }
   
    }
    
    Class EmployeeInfo{
        String status{get;set;}
       List<integrationPractice.Employee> data{get;set;}  //or    integrationPractice.Employee []data {get;set;}
        }
    
    Class  Employee{
        
        string id{get;set;}
        string Employee_name{get;set;}
        string Employee_salary{get;set;}
        string Employee_age{get;set;}
        
    }
        
}