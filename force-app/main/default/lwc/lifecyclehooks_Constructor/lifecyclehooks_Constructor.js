import { LightningElement, api } from 'lwc';
export default class Lifecyclehooks_Constructor extends LightningElement {
  

   @api recordId;
  //Constructor with Example
  constructor(){
        super();
        console.log('Inside constructor');
        console.log('im in Inside constructor');

        
    }


    

}