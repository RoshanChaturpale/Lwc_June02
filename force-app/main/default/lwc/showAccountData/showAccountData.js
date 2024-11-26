import { LightningElement, track, wire } from 'lwc';
import method1 from '@salesforce/apex/lwc_for_account.method1';

export default class ShowAccountData extends LightningElement {

    @wire(method1) searchAcc

    // @track a;

    // SearchData(event){
    //     console.log('im in SearchData');
    //     this.a = event.target.value;
    //     console.log('searchAccountdata', this.a);
    // }


}