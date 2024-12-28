public class CustomAgreementController {
    public Customer_Agreement__c agreement { get; set; }

    public CustomAgreementController() {
        // Get the record ID from the Visualforce page URL
        Id agreementId = ApexPages.currentPage().getParameters().get('id');
        if (agreementId != null) {
            // Query the Customer Agreement record
            agreement = [SELECT Name, Customer_Name__r.Name, Agreement_Type__c, Agreement_Link__c,
                                Agreement_Date__c, Total_Amount__c, Notes__c 
                         FROM Customer_Agreement__c 
                         WHERE Id = :agreementId LIMIT 1];
        }
    }
    
    /*
    public PageReference saveAgreementPDF() {
        // Generate the PDF content
        PageReference pdfPage = Page.CustomerAgreementVfPAge;
        Blob pdfBlob;
        
        // Render the Visualforce page as a PDF
        pdfBlob = pdfPage.getContentAsPDF();

        // Create an attachment and save the PDF
        Attachment attachment = new Attachment();
        attachment.ParentId = agreement.Id;  // Attach to the Customer Agreement record
        attachment.Name = 'Agreement_' + agreement.Customer_Name__c + '.pdf';
        attachment.Body = pdfBlob;
        attachment.ContentType = 'application/pdf';
        insert attachment;

        // Optionally, update the Agreement Link field with the file URL (if stored in Files)
        String fileUrl = '/servlet/servlet.FileDownload?file=' + attachment.Id;
        agreement.Agreement_Link__c = fileUrl;
        update agreement;

        return null;
    }
*/
}