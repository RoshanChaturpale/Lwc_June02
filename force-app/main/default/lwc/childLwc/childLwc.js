import { LightningElement } from 'lwc';

export default class ChildLwc extends LightningElement {

    subtract(){

        this.dispatchEvent(new CustomEvent('subtraction'));

    }

    add(){

        this.dispatchEvent(new CustomEvent('addition'));


    }


    mult(event){

       const multuplyNumber = event.target.value();
        alert('multuplyNumber' , multuplyNumber);

        this.dispatchEvent(new CustomEvent('mulvalue',{detail:multuplyNumber}))

    }


   
}