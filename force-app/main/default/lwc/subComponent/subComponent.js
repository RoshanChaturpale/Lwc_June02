import { LightningElement, wire } from 'lwc';
import { subscribe,  MessageContext, APPLICATION_SCOPE} from 'lightning/messageService';
import FIRST_MESSAGE_CHANNEL from  '@salesforce/messageChannel/firstMessageChannel__c';


export default class SubComponent extends LightningElement {

    messageReceived='';
    subscription;


    @wire(MessageContext)
    MessageContext;

    handleMessage(message){
        this.messageReceived = message.lmsdata;
        
       // this.messageReceived = message.lmsdata.data;

    }

    connectedCallback(){
        this.subscription = subscribe(this.MessageContext, FIRST_MESSAGE_CHANNEL, (message) => {this.handleMessage(message)}, {scope : APPLICATION_SCOPE});
    }

    subscribeHandler(){
        this.subscription = subscribe(this.MessageContext, FIRST_MESSAGE_CHANNEL, (message) => {this.handleMessage(message)}, {scope : APPLICATION_SCOPE});
    }


    

}