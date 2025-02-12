import { LightningElement, wire } from 'lwc';
import { getObjectInfos } from 'lightning/uiObjectInfoApi';
import ACCOUNT_Object from '@salesforce/schema/Account';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

export default class GetObjectInfos extends LightningElement {

    saveData;

    objectApiNames = [ACCOUNT_Object, OPPORTUNITY_OBJECT];


    @wire(getObjectInfos , { objectApiNames: '$objectApiNames'})
    wireFunction({data}){
        if(data){
            console.log('data is ===' , data);
            this.saveData = data.results;
        }

    }
}