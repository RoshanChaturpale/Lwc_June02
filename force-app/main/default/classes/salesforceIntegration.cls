public class salesforceIntegration {
    
    Public static void connectTwoSalesforceOrg(){
        
        String endpoint = 'https://domain.my.salesforce.com/services/oauth2/token';
        String methodType = 'POST';
        string userName = 'username';
        string password = '#pass';
        string grantType = 'password';
        string clientId = '';
        string clientSecretKey = '';
        string andccc = '';
        
        http htp = new http();
        
        httpRequest htpReq = new httpRequest();
        htpReq.setEndpoint(endpoint);
        htpReq.setMethod(methodType);
        htpReq.setBody(
            
            'username=' +userName+
            '&password=' +password+
            '&grant_type=' +grantType+
            '&client_id=' +clientId+
            '&client_secret=' +clientSecretKey
        
        );
        
        httpResponse htpResp = htp.send(htpReq);
        
        system.debug('htpResp'  +htpResp.getBody());
        
    }

}