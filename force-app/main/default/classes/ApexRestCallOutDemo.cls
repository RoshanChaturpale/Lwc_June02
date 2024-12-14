public class ApexRestCallOutDemo {
    
    Public static void getUsersForExternalSystem(){
        
        Http httpObj = new Http();   
        
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint('https://reqres.in/api/users');
        httpReq.setHeader('Content-Type' , 'application/json');
        httpReq.setMethod('GET');
        //httpReq.setBody('');
        
        HttpResponse res = new HttpResponse();
        res = httpObj.send(httpReq);
        
        System.debug('res is ===>' +res);
        System.debug('res is ===>' +res.getBody());
        
        List<Employee__c> empList = new list<Employee__c>();
        
         reqRestWrapper emp =  (reqRestWrapper) Json.deserialize(res.getBody(), reqRestWrapper.Class);

        if(emp != null && emp.data != null){
            for(empData userData : emp.data){
                
                 system.debug('user id ===>' +userData.id);
                 system.debug('user first_name is ===>' +userData.first_name);    
                
                Employee__c e = new Employee__c();
                e.Name = userData.first_name;
                e.Last_Name__c = userData.last_name;
                e.Email__c = userData.email;
                e.Avatar__c = userData.avatar;
                empList.add(e);
            }
            
            if(emp != null){
              Insert empList;
            }
         }
    }
    
    
    Public class reqRestWrapper{
        
        Public integer page{get;set;}
        Public integer per_page{get;set;}
        Public integer total{get;set;}
        public integer total_pages{get;set;}
        
        list<ApexRestCallOutDemo.empData> data{get;set;}
     
    }
    
    Public class empData{
        
        public integer id{get;set;}
        public String email{get;set;}
        Public string first_name{get;set;}
        public string last_name{get;set;}
        public string avatar{get;set;}
    }

}