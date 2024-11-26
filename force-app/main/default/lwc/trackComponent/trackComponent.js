import { LightningElement , track } from 'lwc';
export default class TrackComponent extends LightningElement {

   @track fname = "Roshan";

    handleChange(event) {

        this.fname = event.target.value;

        console.log('Name change ' + this.fname);

    }
}