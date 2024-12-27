import { LightningElement ,api} from 'lwc';
import {CloseActionScreenEvent} from 'lightning/actions';
import verifyPhoneAndUpdateAccount from '@salesforce/apex/VerifyPhoneNumberApi.verifyPhoneAndUpdateAccount';



export default class VerifyPhoneNumberWithApi extends LightningElement {

    @api recordId; // Current Account ID
    isLoading = false;
    message = '';
    error = '';

    

    handleVerifyPhone() {
        this.isLoading = true;
        this.message = '';
        this.error = '';

        verifyPhoneAndUpdateAccount({ accountId: this.recordId })
            .then((result) => {
                this.message = result;
            })
            .catch((error) => {
                this.error = error.body ? error.body.message : 'An unexpected error occurred.';
            })
            .finally(() => {
                this.isLoading = false;
            });
    }
}