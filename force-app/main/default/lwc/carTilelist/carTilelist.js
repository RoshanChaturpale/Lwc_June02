import { LightningElement, wire } from 'lwc';
import getCar from '@salesforce/apex/carController.getCar';

export default class CarTilelist extends LightningElement {

    cars;
    error;
    @wire(getCar) 
    carProperty({data,error}){

        if(data){
           //console.log('car data ==' , data);
            this.cars = data;
        }
        if(error){
            this.error = error;
           // console.log('error is' , error);
        }

    };

}