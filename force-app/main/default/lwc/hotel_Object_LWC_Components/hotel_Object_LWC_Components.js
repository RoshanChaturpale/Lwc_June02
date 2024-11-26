import { LightningElement, track, wire } from 'lwc';
import showHotelData from '@salesforce/apex/HotelData.showHotelData';

export default class Hotel_Object_LWC_Components extends LightningElement {

  
    @track data;
    @track columns = [

        {label: 'Hotel Name' , fieldName:'Hotel_Name__c', type:'Text'},
        {label: 'Hotel Type' , fieldName:'Hotel_Type__c', type:'Picklist'} 
    ];

    @wire(showHotelData) HotelRecords({error,data}){
     
        if(data){
            this.data = data;
        }else if(error){
            this.data = undefined;
        }

    }

    // @wire(showHotelData) hotelDetails;
}