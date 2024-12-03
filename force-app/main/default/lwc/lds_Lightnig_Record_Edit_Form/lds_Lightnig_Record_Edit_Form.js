import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import Cricket_ObjectApiName from '@salesforce/schema/Cricketers__c';
import Cricket_Name_Field from '@salesforce/schema/Cricketers__c.Name';


import cricketer_Age from '@salesforce/schema/Cricketers__c.Age__c';
import cricketer_Nationality from '@salesforce/schema/Cricketers__c.Nationality__c';
import Cricketer_Runs from '@salesforce/schema/Cricketers__c.Runs__c';



export default class Lds_Lightnig_Record_Edit_Form extends LightningElement {


    objectApiName = Cricket_ObjectApiName;

    Name_Field =  Cricket_Name_Field;
    Age_Field = cricketer_Age;
    Nationality_Field = cricketer_Nationality;
    Runs_Field = Cricketer_Runs;
    cricketId = 'Created Cricketer Id Will display here';

    handleSuccess(event){

        this.cricketId = event.detail.id;

        const events = new ShowToastEvent({
            title: 'Success',
            message: 'Want to display toast example',
            variant: 'success',

        });
        this.dispatchEvent(events);
    }


}