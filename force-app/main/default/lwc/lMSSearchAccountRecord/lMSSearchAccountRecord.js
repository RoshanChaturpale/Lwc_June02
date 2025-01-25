import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import FIRST_MESSAGE_CHANNEL from  '@salesforce/messageChannel/firstMessageChannel__c';

export default class LMSSearchAccountRecord extends LightningElement {

    searchKey='';

    @wire(MessageContext)
    messegeContext;

    onChangeHandler(event){

        this.searchKey = event.target.value;

    }


    SearchAccountHandler(){

        //console.log('searchKey is ' , this.searchKey);
        publish(this.messegeContext , FIRST_MESSAGE_CHANNEL, {lmsdata : this.searchKey});
    }
}