import { LightningElement, track } from 'lwc';
export default class Practice_track_decorator extends LightningElement {

    @track fname = "roshan salesforce";

    handleChange(event){
        this.fname = event.target.value;
        console.log('fname is ==>' , this.fname);
    }

}