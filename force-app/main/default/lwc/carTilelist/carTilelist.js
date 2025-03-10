import { LightningElement, wire } from 'lwc';
import getCar from '@salesforce/apex/carController.getCar';


import { publish, subscribe, MessageContext } from 'lightning/messageService';
import CAR_FILTER from '@salesforce/messageChannel/carLMS__c';
import CAR_RECORD_ID from '@salesforce/messageChannel/carIdLMS__c';



export default class CarTilelist extends LightningElement {

    cars=[];
    error;
    carFilterSubscription;
    filter={};
    add
    
    @wire(getCar, {filters : '$filter'}) 
    carProperty({data,error}){

        if(data){
          // console.log('car data ==' , data);
            this.cars = data;
        }
        if(error){
            //this.error = error;
           // console.log('error is' , error);
        }

    };


    @wire(MessageContext)
    messageContext;


    connectedCallback(){
        this.subscribeHandler();
    }


    subscribeHandler(){

       this.carFilterSubscription = subscribe(this.messageContext, CAR_FILTER, (message) => this.messageHandler(message));


    }

    messageHandler(messsage){
       // console.log('message is', messsage.filters);
        this.filter = messsage.filters;

    }

    cardClick(event){

        this.add =event.detail;
        //console.log('this add', this.add);
        publish(this.messageContext, CAR_RECORD_ID, {Carid : this.add});

    }



}