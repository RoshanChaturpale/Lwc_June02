import { LightningElement, wire } from 'lwc';

import { subscribe, unsubscribe, APPLICATION_SCOPE, MessageContext } from 'lightning/messageService';
import recordIdSelected from '@salesforce/messageChannel/viewAccountContactschannel__c';

import getAccountContactData from '@salesforce/apex/accountData.getAccountContactData';

export default class AccountContacts extends LightningElement {


    subscription = null;
    accId = '';
    saveData;
    title = 'Contacts';
    isVisible= false;
    editableContactId;
    


    //LMS Part
    //////////////////////////////////////////////////////////////////
    @wire(MessageContext)
    messageContext;

    connectedCallback(){
        this.subscribeToMessageChannel();
    }


    subscribeToMessageChannel(){

        if(!this.subscription){

            this.subscription = subscribe(
                this.messageContext,
                recordIdSelected,
                (message) => this.handleMessage(message),
                 {scope: APPLICATION_SCOPE}
            );  

        }

         
     }

     handleMessage(message){
      //  console.log('Account Id is ==> ', message.accountRecordId);
      //  console.log('Account Name is ==> ', message.accountName);
      //  console.log('Account accountEmail is ==> ', message.accountEmail);


        this.accId = message.accountRecordId;

        this.getContacts();

        


     }
     getContacts(){
        getAccountContactData({recordId : this.accId})
        .then(result => {
           // console.log('rsult is ===>' ,result);
            this.saveData = result;
            
                })
        .catch(error => {
            console.log('imperative error is found..');

        })

     }

     disconnectedCallback(){
        this.unsubscribeMessagaChannel();
    }

    unsubscribeMessagaChannel(){
        unsubscribe(this.subscribeToMessageChannel);
    }
////////////////////////////////////////////////////////////////////////
    
//call Apex Class to ShowData

editButtonHandler(event){
    //console.log('edti mode');
    this.editableContactId = event.target.dataset.contactid;
    console.log('this.editableContactId', this.editableContactId);
    this.isVisible = true;
    

}

deleteButtonHandler(event){
    console.log('delete');
    this.editableContactId = event.target.dataset.contactId;
    console.log('this.deletableContactId', this.editableContactId);



}

popupCloseHandler(event){

    this.isVisible = false;
    this.editableContactId = null;


}

handleSuccess(){

    this.popupCloseHandler();
    this.getContacts();

}

addContactHandler(){
    this.isVisible = true;

}



}