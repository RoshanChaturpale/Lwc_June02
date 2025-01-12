import { LightningElement } from 'lwc';

export default class P2cParentComponent extends LightningElement {

    inputvalue = '';
    
    handleChange(event){
        this.inputvalue = event.target.value;
    }
}