public class MovieIntegrationRestApi {
    
    @AuraEnabled(cacheable=true)
    public static string getMovies(string searchText){
                system.debug('org searchText is =====> ' + searchText);

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //request.setEndpoint('https://api.collectapi.com/imdb/imdbSearchByName?query='+searchText);
        request.setEndpoint('callout:IMDB/imdb/imdbSearchByName?query='+searchText);
        request.setMethod('GET');
        //request.setHeader('Authorization', 'apikey 31z6lkMzcHOZPzLsLaytqO:0JQ53xPbbieDEhoHpBkkqA');
        HttpResponse response = http.send(request);
        System.debug('Status Code: '+response.getStatusCode());
        System.debug('Body: '+response.getBody());
        if (response.getStatusCode() == 200) {
            return response.getBody();
        }
        else{
            return 'Error Code :'+response.getStatusCode();
        }
        //return response;
        
        
    }
     
    @AuraEnabled(cacheable=true)
    public static string getMoviessss(string searchText) {
        system.debug('org searchText is =====> ' + searchText);
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
           // request.setEndPoint('https://api.collectapi.com/imdb/imdbSearchByName?query=' +searchText);
            request.setEndPoint('callout:IMDB/imdb/imdbSearchByName?query=' +searchText);

            request.setMethod('GET');
            //request.setHeader('Authorization', 'apikey 3R1U03x0ICkr7uuigvpnq8:2D3N930IMCv8BA7GtKXhfM');  use in Named Credentials

            HttpResponse response = http.send(request);

            if (response.getStatusCode() == 200) {
                MovieWrapper movieWrapper = (MovieWrapper) JSON.deserialize(response.getBody(), MovieWrapper.class);
                System.debug('Movies Wrapper isssss: ' + movieWrapper);

                for (MovieWrapper.result movie : movieWrapper.result) {
                    System.debug('Movie Details: ' + movie);
                }

                return response.getBody();
            } else {
                return 'Error code: ' + response.getStatusCode();
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
            return 'Error: ' + e.getMessage();
        }
    }
}