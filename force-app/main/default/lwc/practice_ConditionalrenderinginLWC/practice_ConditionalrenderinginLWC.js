import { LightningElement ,track } from 'lwc';



export default class Practice_ConditionalrenderinginLWC extends LightningElement {

    @track fName = true;
    @track lName = false;
    
    showFirstName(){

        this.fName = true;
        this.lName = true;

    }


    showLastName(){

        this.fName = false;
        this.lName = false;

    }

}