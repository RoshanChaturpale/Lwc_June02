import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';


export default class CreateRecordDemo extends LightningElement {

     fields={};


    changeHandler(event){

        const{name, value} = event.target;
        fields[name] = value;
    }


    createContactHandler(){


        const recordInput = { apiName: CONTACT_OBJECT.objectApiName, fields };

        createRecord(recordInput)
        .then(result => {
            console.log('record Created Successfully...');
        }); 



    }
}