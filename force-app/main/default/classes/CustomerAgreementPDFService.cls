public class CustomerAgreementPDFService {
    
   
    @AuraEnabled
    public static void generateAndSendAgreement(Id agreementId) {
        try {
            // Fetch the Customer_Agreement__c record by ID
            Customer_Agreement__c agreement = [
                SELECT Id, Status__c, Customer_Name__c, Customer_Name__r.Name, Customer_Name__r.Account_Email__c , Agreement_Link__c
                FROM Customer_Agreement__c 
                WHERE Id = :agreementId 
                LIMIT 1
            ];
            
            // Generate the PDF
            PageReference pdfPage = Page.CustomerAgreementVfPage;
            pdfPage.getParameters().put('id', agreementId);
            Blob pdfBlob = pdfPage.getContentAsPDF();

            // Create the Attachment record
            Attachment attachment = new Attachment();
            attachment.ParentId = agreementId; // Parent record (e.g., Customer_Agreement__c)
            attachment.Name = 'CustomerAgreement_'+agreement.Customer_Name__r.Name+'.pdf';
            attachment.Body = pdfBlob;
            attachment.ContentType = 'application/pdf';
            insert attachment;

            // Construct the attachment URL
            String baseUrl = getBaseUrl();
            String attachmentUrl = baseUrl + '/servlet/servlet.FileDownload?file=' + attachment.Id;
            
            //Update Agreement_Link__c field
            agreement.Agreement_Link__c = attachmentUrl;
            agreement.Status__c = 'Sent';
            update agreement;

            // Send an email to the customer with the attachment link
            sendAgreementEmail(agreement, attachmentUrl);

        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
            throw new AuraHandledException('Failed to generate or send agreement: ' + e.getMessage());
        }
    }

    // Method to send the email with the agreement link
    private static void sendAgreementEmail(Customer_Agreement__c agreement, String attachmentUrl) {
        try {
            String emailBody = 'Hello ' + agreement.Customer_Name__r.Name + ',\n\n'
                               + 'Please review and sign your agreement using the link below:\n\n'
                               + attachmentUrl + '\n\nThank you!';
            
            // Create and send email
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] { agreement.Customer_Name__r.Account_Email__c });
            mail.setSubject('Your Agreement is Ready for Signature');
            mail.setPlainTextBody(emailBody);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

        } catch (Exception e) {
            System.debug('Error sending email: ' + e.getMessage());
            throw new AuraHandledException('Failed to send email: ' + e.getMessage());
        }
    }

    // Helper method to get the Salesforce base URL
    private static String getBaseUrl() {
        String baseUrl = URL.getOrgDomainUrl().toExternalForm();
        return baseUrl;
    }
}