import { LightningElement } from 'lwc';

export default class ParentLwc extends LightningElement {


    counter = 0;

    sub(){

        this.counter--;

    }

    addd(){

        console.log('addd');

        this.counter++;


    }

    mulnumber(event){
const multnumber = event.detail;

this.counter = this.counter * multnumber;
  

    }
}