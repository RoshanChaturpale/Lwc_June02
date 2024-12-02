import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; 

export default class Practice_toast_notification extends LightningElement {

    

    SuccesshandleClick() {
        this.SuccessshowToast();
        console.log('handleClick');
    }

    WarninghandleClick(){
        this.WorningshowToast();

    }

    errorhandleClick(){
        this.errorshowToast();

    }

    //Success toast Notification
    SuccessshowToast() {
        const event = new ShowToastEvent({ // Correct capitalization
            title: 'Success',
            message: 'Want to display toast example',
            variant: 'success',
        });
        this.dispatchEvent(event); // Correctly dispatch the event
    }

    //Warning toast Notification
    WorningshowToast(){

        const worningToast = new ShowToastEvent({
            title : 'Worning',
            message : 'Worning - messege with toast Notification',
            variant : 'Warning'
        });
        this.dispatchEvent(worningToast);
    }


    //Error toast Notification
    errorshowToast(){

        const errorToast = new ShowToastEvent({
            title : 'error',
            message : 'error -  messege with toast Notification',
            variant : 'Error'
        });
        this.dispatchEvent(errorToast);
    }


}