import { LightningElement, api, track } from 'lwc';
import {CloseActionScreenEvent} from 'lightning/actions';

import generateAndSendAgreement from '@salesforce/apex/CustomerAgreementPDFService.generateAndSendAgreement';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CustomerAgreementLwc extends LightningElement {
    @api recordId;
    @track isLoading = false;

    handleGenerateSend() {
        this.isLoading = true;
        generateAndSendAgreement({ agreementId: this.recordId })
            .then((attachmentUrl) => {
                this.isLoading = false;
                this.showToast('Success', 'Agreement generated and sent successfully!', 'success');
                console.log('Attachment URL:', attachmentUrl);
            })
            .catch((error) => {
                this.isLoading = false;
                this.showToast('Error', 'Failed to generate and send the agreement.', 'error');
                console.error(error);
            });
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title,
            message,
            variant,
        });
        this.dispatchEvent(event);
    }
}
