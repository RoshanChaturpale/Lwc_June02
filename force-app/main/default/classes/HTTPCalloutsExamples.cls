public class HTTPCalloutsExamples {
    
    
    Public static void method1(){
        
        Http htp = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndPoint('https://jsonplaceholder.typicode.com/posts');
        req.setMethod('GET');
        
        HttpResponse res = htp.send(req);
        
       String status = res.getStatus();
        integer statuscode  = res.getStatusCode();
        
        string stg = res.getBody();
        
        system.debug('stg is ==' +status);
        system.debug('stg is ==' +statuscode);
        system.debug('stg is ==' +stg);
        
    }

}