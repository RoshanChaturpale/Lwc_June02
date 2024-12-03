import { api, LightningElement } from 'lwc';
import Cricket_Object from '@salesforce/schema/Cricketers__c';
import Name_field from '@salesforce/schema/Cricketers__c.Name';
import Age_field from '@salesforce/schema/Cricketers__c.Age__c';
import Nationality_field from '@salesforce/schema/Cricketers__c.Nationality__c';
import Image_field from '@salesforce/schema/Cricketers__c.Images__c';


export default class Lds_Lightning_Record_View_Form extends LightningElement {

    //object
    cricket_Object_Api_Name = Cricket_Object;

    //fields
    nameFied = Name_field;
    ageField = Age_field;
    NationalityField = Nationality_field;
    imageField = Image_field;

    @api recordid = 'a1FJ30000005ReaMAE';

}