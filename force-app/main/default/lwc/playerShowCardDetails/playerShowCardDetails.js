import { LightningElement,wire } from 'lwc';

import { subscribe, MessageContext } from 'lightning/messageService';
import CRICKET_CARD_ID from '@salesforce/messageChannel/PlayerCardRecordId__c';


import getCricketerData from '@salesforce/apex/apexClass_practice_LWC.getCricketerData';
import Json_format from '@salesforce/resourceUrl/Json_format';

import {NavigationMixin} from 'lightning/navigation';

export default class PlayerShowCardDetails extends NavigationMixin(LightningElement){

    PlayercardId;
    subscribeChannel;
    saveData;




    //LMS
    @wire(MessageContext)
    messageContext;


    //LMS
    connectedCallback(){

        this.subscribeChannel = subscribe(this.messageContext, CRICKET_CARD_ID, (message) => {
            this.handleClickPlayerCard(message)
        }); 
    }

    //LMS
    handleClickPlayerCard(message){
        this.PlayercardId = message.playerRecordId;
       // console.log(' this.PlayercardId' ,  this.PlayercardId);

       getCricketerData({playerId : this.PlayercardId})
       .then(result => {

       // console.log('selected Player Detail is ===> ' +JSON.stringify(result))
       this.saveData = result;

       })
       .catch(error => {
        //console.log('error is found');
       })
    }


    //////////////////////////////////////////////////////////////////c/accountDataInTableFormate

    handleNavigateToRecord(){

        this[NavigationMixin.Navigate]({
            type : 'standard__recordPage',
            attributes : {
                recordId : this.PlayercardId,
                 objectApiName : 'Cricketers__c',
                 actionName : 'view'
            }
        })


    }







}