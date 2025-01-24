import { LightningElement, wire, track } from 'lwc';
import { publish , MessageContext } from 'lightning/messageService';
import FIRST_MESSAGE_CHANNEL from  '@salesforce/messageChannel/firstMessageChannel__c';


export default class PubComponent extends LightningElement {

    @wire(MessageContext)
    messageContext


    inputMessage='';

    //for Input Text
    inputTextHandler(event){
        this.inputMessage = event.target.value;

      publish(this.messageContext, FIRST_MESSAGE_CHANNEL, {lmsdata : this.inputMessage});
    }
    }

    //with button
    // publishHandler(){
    
    //     //console.log('this.inputMessage=====> ', this.inputMessage);
    //     const message ={
    //         lmsdata : {
    //             data:this.inputMessage
    //         }
    //     }

    //  publish(this.messageContext, FIRST_MESSAGE_CHANNEL, message);
    // }


    
