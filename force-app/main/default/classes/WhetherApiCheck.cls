public class WhetherApiCheck {
    
    @AuraEnabled
    Public static String whetherApi(String name){
        
        // Retrieve the API key from the custom label
        String apiKey = Label.weather_Api_Key;
        
        
        
        Http htp = New Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndPoint('http://api.weatherapi.com/v1/current.json?key='+apiKey+'&q='+EncodingUtil.urlEncode(name, 'UTF-8'));
        req.setMethod('GET');
        
        HttpResponse res = New HttpResponse();
        res = htp.send(req);
        
        string a = res.getBody();
        
        return a;
        
        //system.debug('res is ===>' +res.getBody().toString());
        
    }
    
    
    Public Class WetherWrapper{
        
       
    }

}