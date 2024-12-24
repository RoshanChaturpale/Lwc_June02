import { LightningElement } from 'lwc';
export default class Parentlwc1 extends LightningElement {


   startcounter = 0;

   onChangeStartCounter(event){

       this.startcounter = event.target.value;
      // console.log('im in onChangeStartCounter with parent' , startcounter);
   }
}