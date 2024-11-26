import { LightningElement, api } from 'lwc';
export default class Lifecyclehooks_Constructor extends LightningElement {
  

   @api recordId;
  //Constructor with Example
  constructor(){
        super();
        console.log('Inside constructor');
        console.log('im in Inside constructor');

        
    }


    //ConnectedCallBack with Example
   connectedCallback()
    {
        console.log('Inside connected callback');
    }

    //disConnectedCallBack with Example
     disconnectedCallback(){
        console.log('Inside disconnected callback');
    }

}