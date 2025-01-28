import { api, LightningElement, wire } from 'lwc';
import getCricketerList from '@salesforce/apex/apexClass_practice_LWC.getCricketerList'
import Json_format from '@salesforce/resourceUrl/Json_format';

import { publish, MessageContext } from 'lightning/messageService';
import CRICKET_CARD_ID from '@salesforce/messageChannel/PlayerCardRecordId__c';

export default class PlayerSearchResults extends LightningElement {

    cricketerNationality = '';
    cricketersData;
    selectedPlayerId;
    //PlayerId;

    @wire(getCricketerList , { nationality : '$cricketerNationality'}) 
    wiredCricketers({error,data}){

        if(error){
           // console.log('error:' +JSON.stringify(error));
        }else if(data){
            this.cricketersData = data;
            //console.log('this.cricketersData:' +JSON.stringify(this.cricketersData));
        }
    }

    //LMS
    @wire(MessageContext)
    messageContext;

    //target id
    handleClickPlayerCard(event) {
       // console.log('handleClickPlayerCard');
    
        // Ensure dataset and id are available
         this.selectedPlayerId = event.currentTarget.dataset.id;
         //console.log('this.selectedPlayerId',this.selectedPlayerId);

         //LMS
         publish(this.messageContext, CRICKET_CARD_ID, { playerRecordId : this.selectedPlayerId});


        //blue border
        let BoxClass = this.template.querySelectorAll('.selected');
        if(BoxClass.length > 0){
            this.removeClass();
        }

        //current selected player card detail
        let playerBox = this.template.querySelector(`[data-id="${this.selectedPlayerId}"]`);
        if(playerBox){
            playerBox.className = 'title_wrapper selected';
        }


        //custom event (send child to parent) -data
        this.dispatchEvent(new CustomEvent('select' ,{detail:{playerId : this.selectedPlayerId}}))



    }

    //remove blue border for current image
    removeClass()
        {
            this.template.querySelectorAll('.selected')[0].classList.remove('selected');
        }

        @api searchCricketers(NationalityOfCricketer){

          //  console.log('value in Child LWC' + JSON.stringify(NationalityOfCricketer));

            this.cricketerNationality =  NationalityOfCricketer;


        }
    
}