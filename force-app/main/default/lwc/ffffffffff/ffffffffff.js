import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Ffffffffff extends LightningElement {

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
        try {
            let isValid = this.isInputValid();
            if (isValid) {
                this.template.querySelector('lightning-record-edit-form').submit();
            }
        } catch (error) {
            console.error('Error in handleSubmit:', error);
        }
    }

    handleSuccess() {
        const toastEvent = new ShowToastEvent({
            title: 'Success',
            message: 'Record created successfully.',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(toastEvent);

        // Clear the form after successful submission
        this.clearForm();
    }


    // clearForm() {
    // const recordForm = this.template.querySelector('lightning-record-edit-form');
    // if (recordForm) {
    //     recordForm.reset();  // Resets the form fields
    //      }
    // }

       
}