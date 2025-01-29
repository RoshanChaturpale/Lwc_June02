import { LightningElement, track} from 'lwc';

//import searchAccountData from '@salesforce/apex/accountData.searchAccountData';

export default class AccountSearchForm extends LightningElement {
    

    message = '';

    // Capture input field value
    handleInputChange(event) {
        this.message = event.target.value;
    }

    // Button Click Handler: Call Child Method using querySelector
    handleButtonClick() {
        const childComponent = this.template.querySelector('c-account-data-result').showMessage(this.message);

        // const childComponent = this.template.querySelector('c-account-data-result');
        // if (childComponent) {
        //     childComponent.showMessage(this.message);
        // }
    }
}