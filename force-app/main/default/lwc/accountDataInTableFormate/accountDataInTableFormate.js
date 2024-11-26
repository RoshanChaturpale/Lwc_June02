import { LightningElement, track, wire } from 'lwc';
import accData from '@salesforce/apex/accountData.accData';

export default class AccountDataInTableFormate extends LightningElement {

    // @track data;
    // @track columns = [

    //     {label: 'Hotel Name' , fieldName:'Hotel_Name__c', type:'Text'},
    //     {label: 'Hotel Type' , fieldName:'Hotel_Type__c', type:'Picklist'} 
    // ];

    // @wire(showHotelData) HotelRecords({error,data}){
     
    //     if(data){
    //         this.data = data;
    //     }else if(error){
    //         this.data = undefined;
    //     }

    // }

    // @wire(showHotelData) hotelDetails;
    @track data;
    @track columns = [
        {label: 'Account Name' , fieldName:'Name' , type:'text'},
        {label: 'Account Phone', fieldName:'Phone', type:'Phone'}
    ];

    @wire(accData) accountdata({error,data}){
        if(data){
            this.data = data;
        }else if(error){
            this.data = undefined;
        }
    }
}