import { LightningElement, track } from 'lwc';
export default class Handling_lightning_input_in_lwc extends LightningElement {

   
 @track fname = "Roshan Chaturpale";
   handleChange(event) {
       this.fname = event.target.value;
       console.log('Name change ' + this.fname);
   }


}