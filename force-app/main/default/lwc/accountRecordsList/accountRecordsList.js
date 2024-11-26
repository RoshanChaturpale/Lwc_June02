import { LightningElement, wire } from 'lwc';
import getAccountss from '@salesforce/apex/accountData.getAccountss';

export default class AccountRecordsList extends LightningElement {

    @wire(getAccountss) accounts;
    accountidfrmparent;
    handleClick(event){
        event.preventDefault();     
        this.accountidfrmparent = event.target.dataset.accountid;       
    }
}