import { LightningElement, track } from 'lwc';

export default class FirstApplication extends LightningElement {
    @track showSubmitForm = false;

    
    showFormEventHandller(event){
        console.log('this is onClickhandller event' , event);
        this.showSubmitForm =true

    }

    submitFormEventHandller(event){
        console.log('this is submitFormEventHandller class' , event);
    }

    hideFormEventHandller(event){
        console.log("im in hideFormEventHandller event" , event);
        this.showSubmitForm = false;
    }
}