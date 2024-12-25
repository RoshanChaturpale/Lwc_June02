public class salesforceIntegration {
    
    Public static void connectTwoSalesforceOrg(){
        
        String endpoint = 'https://june02-dev-ed.develop.my.salesforce.com/services/oauth2/token';
        String methodType = 'POST';
        string userName = 'june02@roshan.com';
        string password = '#roshan1234jR7bNOWPCG5dO2T4hplCMNca';
        string grantType = 'password';
        string clientId = '3MVG9wt4IL4O5wvIxzMUMzmfTkbYBl5CtP4d5YpzDpQQkxEbC3sTL.7rG1YVPK8Mey7kv_ouE6gVuXYn4INsS';
        string clientSecretKey = 'F7B36B1614FBC0FEB8C29623CBC21913B47D2697943BF28696369117E9CE587C';
        
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