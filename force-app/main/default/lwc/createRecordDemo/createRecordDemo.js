import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';


export default class CreateRecordDemo extends LightningElement {

     formfields={};


    changeHandler(event){

        const{name, value} = event.target;
        this.formfields[name] = value;
    }


    createContactHandler(){


        const recordInput = { apiName: CONTACT_OBJECT.objectApiName, fields : this.formfields};

        createRecord(recordInput)
        .then(result => {
            console.log('record Created Successfully...');
            alert('record created successfully');
        }); 



    }
}