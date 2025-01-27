import { LightningElement, wire } from 'lwc';
import { subscribe,  MessageContext, APPLICATION_SCOPE} from 'lightning/messageService';
import FIRST_MESSAGE_CHANNEL from  '@salesforce/messageChannel/firstMessageChannel__c';
import getAccountData from '@salesforce/apex/apexClass_practice_LWC.getAccountData';




const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
];


export default class LMSSearchAccountRecordComponent extends LightningElement {

        accountData; 
        messageReceiver='';
        subscription;          // Holds fetched account data
        data;
    columns = columns;
    
        @wire(getAccountData, { textkey: '$messageReceiver' })
            wiredData({ data, error }) {
                if (data) {
                    this.data = data;
                    this.error = undefined;
                   // console.log('Fetched Data:', JSON.stringify(this.data));
                } 
            }

 

    @wire(MessageContext)
    messageContext;

    connectedCallback(){

        this.subscription = subscribe(this.messageContext, FIRST_MESSAGE_CHANNEL , (message) => {this.messageHandller(message)});
    }


    messageHandller(message){
        this.messageReceiver = message.lmsdata;
    }



}