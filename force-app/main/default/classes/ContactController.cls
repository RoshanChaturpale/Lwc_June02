public with sharing class ContactController {
    private static final Integer MAX_RETRIES = 3;

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [SELECT Id, Name, Email FROM Contact LIMIT 100];
    }

    @AuraEnabled
    public static void createContact(Contact contact) {
        retryableInsert(contact);
    }

    private static void retryableInsert(Contact contact) {
        Integer retries = 0;
        Boolean success = false;
        while (!success && retries < MAX_RETRIES) {
            try {
                retries++;
                insert contact;
                success = true;
            } catch (DmlException e) {
                if (e.getMessage().contains('UNABLE_TO_LOCK_ROW')) {
                    if (retries == MAX_RETRIES) {
                        throw e;
                    }
                    // Optional: Add a small delay before retrying
                    System.debug('Retry attempt ' + retries + ' for contact ' + contact.Id);
                   // System.sleep(2000);
                } else {
                    throw e;
                }
            }
        }
    }
}