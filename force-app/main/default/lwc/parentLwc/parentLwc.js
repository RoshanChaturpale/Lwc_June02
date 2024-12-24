import { LightningElement } from 'lwc';
export default class ParentLWC extends LightningElement {

    countValue = 0;

    incrementwithNumber(){
       // console.log('i am in incrementwithNumber method');
        this.countValue++;
    }


    decrementwithNumber(){
        this.countValue--;
    }

}