import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class IntegrationSettingAccordionDuplicateRDF extends LightningElement {


    isInputValid() {
        let isValid = true;
        let inputFields = this.template.querySelectorAll('lightning-input-field');
        inputFields.forEach(inputField => {
            if (!inputField.reportValidity()) {
                isValid = false;
            }
        });
        return isValid;
    }

    handleSubmit() {
        // Custom logic before submission
        let isValid = this.isInputValid();

        if (isValid) {
            // Submit the form
            this.template.querySelector('lightning-record-edit-form').submit();
        }
    }

    handleSuccess(event) {
        // Get the ID of the created record
        const recordId = event.detail.id;

        // Show a success message with the record ID
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: ' Record created successfully! ',
                variant: 'success',
            }),
        );
    }

    handleError(event) {
        // Show an error message if the form submission fails
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: 'There was an error creating the record.',
                variant: 'error',
            }),
        );
    }
}