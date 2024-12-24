import { LightningElement } from 'lwc';
export default class ChildLWC extends LightningElement {

    addHandleClick(){


                this.dispatchEvent(new CustomEvent('forincrement'));

    }


    


    subHandleClick(){

        this.dispatchEvent(new CustomEvent('fordecrement'));

    }

}