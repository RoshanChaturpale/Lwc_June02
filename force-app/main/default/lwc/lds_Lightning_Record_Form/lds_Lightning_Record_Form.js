import { LightningElement, track } from 'lwc';
import CricketObject from '@salesforce/schema/Cricketers__c';

import Cricket_Name from '@salesforce/schema/Cricketers__c.Name';
import Cricket_Age from '@salesforce/schema/Cricketers__c.Age__c';
import Cricket_Nationality from '@salesforce/schema/Cricketers__c.Nationality__c';


export default class Lds_Lightning_Record_Form extends LightningElement {

    cricket_Object = CricketObject;
    recordId = 'a1FJ30000005ReaMAE';
    @track fields = [Cricket_Name , Cricket_Age , Cricket_Nationality];

    onSubmitHandller(event){
        
    }
}