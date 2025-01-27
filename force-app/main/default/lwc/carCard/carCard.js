import { LightningElement,api,wire } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Car__c.Name';
import PUCTURE_URL_FIELD from '@salesforce/schema/Car__c.Picture_URL__c';
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';
import MAKE_FILED from '@salesforce/schema/Car__c.Make__c';
import MSRP_FILED from '@salesforce/schema/Car__c.MSRP__c';
import FUEL_FIELD from '@salesforce/schema/Car__c.Fuel_Type__c';
import SEAT_FEILD from '@salesforce/schema/Car__c.Number_of_Seats__c';
import CONTROL_FILED from '@salesforce/schema/Car__c.Control__c';
import { getFieldValue} from 'lightning/uiRecordApi';

import { subscribe, MessageContext } from 'lightning/messageService';
import CAR_RECORD_ID from '@salesforce/messageChannel/carIdLMS__c';


export default class CarCard extends LightningElement {

  categoryField = CATEGORY_FIELD;
  makeField  = MAKE_FILED;
  msrpField = MSRP_FILED;
  fuelField = FUEL_FIELD;
  seatField = SEAT_FEILD;
  controlField = CONTROL_FILED;


  
  carName;
  carPictureUrl;

    @api recordId;

    handleRecordLoaded(event){

        const {records} = event.detail;
        const recordData = records[this.recordId];
        this.carName = getFieldValue(recordData, NAME_FIELD);
        this.carPictureUrl = getFieldValue(recordData, PUCTURE_URL_FIELD);
    }



    @wire(MessageContext)
    messageContext;

    subscription;


    connectedCallback(){

      this.subscription = subscribe(this.messageContext, CAR_RECORD_ID, (message) => this.handleMessage(message));
    }

    handleMessage(message){

      this.recordId = message.Carid;
      //console.log('carid is =..... ' , this.recordId);




    }
}