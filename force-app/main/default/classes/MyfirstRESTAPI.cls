public class MyfirstRESTAPI {
    
    @future(callout=true)
    Public static void method1(){
        
        http htp = new http();
        
        httpRequest  request = new httpRequest();
        request.setEndpoint('callout:Saleforce_target/services/apexrest/myapi/');
        request.setMethod('GET');
        
        httpResponse response = htp.send(request);
        
        system.debug('response' +response.getBody());
        
        
        
    }

}