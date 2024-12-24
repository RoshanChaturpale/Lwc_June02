import { LightningElement } from 'lwc';
export default class LifeCycleHookExample extends LightningElement {

    constructor(){

        super();

        console.log('call received from Constructor');
    }



    connectedCallback() {
     
        console.log('call received from connectedCallBack');
    }

}