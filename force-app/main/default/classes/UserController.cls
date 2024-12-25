public with sharing class UserController {
    @AuraEnabled(cacheable=true)
    public static Id getAccountId() {
        // Fetch the User's related AccountId (adjust based on your data model)
        User loggedInUser = [SELECT ContactId FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
        return loggedInUser.ContactId;
    }
}