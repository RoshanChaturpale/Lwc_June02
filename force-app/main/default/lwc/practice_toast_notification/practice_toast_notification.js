import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 

export default class Practice_toast_notification extends LightningElement {

    

    handleClick() {
        this.showToast();
        console.log('handleClick');
    }

    showToast() {
        const event = new ShowToastEvent({ // Correct capitalization
            title: 'Success',
            message: 'Want to display toast example',
            variant: 'success',
        });
        this.dispatchEvent(event); // Correctly dispatch the event
    }
}