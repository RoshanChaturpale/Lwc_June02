import { LightningElement, wire } from 'lwc';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetObjectInfo extends LightningElement {

    defaultRecordTypeId;

    @wire(getObjectInfo , {objectApiName: ACCOUNT_OBJECT})
    getData(data){
        if(data){
            console.log('this is my data -==' ,data);
            this.defaultRecordTypeId = data.defaultRecordTypeId;
        }
    }
}