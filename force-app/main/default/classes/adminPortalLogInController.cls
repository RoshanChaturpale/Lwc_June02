public class adminPortalLogInController {
    
    
   @AuraEnabled
    public static String login(String username, String password, string startURL) {
        try {
            // Attempt to log in the user and redirect to the Hospital page on success
            ApexPages.PageReference loginPage = Site.login(username, password, '/Hospital');

            if (loginPage != null) {
                // Successful login
                return loginPage.getUrl();
            } else {
                // Login failed, redirect to the login page or return an error message
                return '/login';
            }
        } catch (Exception e) {
            // Handle login failure
            throw new AuraHandledException('Login failed: ' + e.getMessage());
        }
    }

}