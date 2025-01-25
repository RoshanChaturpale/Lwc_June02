import { LightningElement, wire } from 'lwc';
import { subscribe,  MessageContext, APPLICATION_SCOPE} from 'lightning/messageService';
import FIRST_MESSAGE_CHANNEL from  '@salesforce/messageChannel/firstMessageChannel__c';

export default class LMSSearchAccountRecordComponent extends LightningElement {

    messageReceiver='';
    subscription;

    @wire(MessageContext)
    messageContext;

    connectedCallback(){

        this.subscription = subscribe(this.messageContext, FIRST_MESSAGE_CHANNEL , (message) => {this.messageHandller(message)});
    }


    messageHandller(message){
        this.messageReceiver = message.lmsdata;
    }
}