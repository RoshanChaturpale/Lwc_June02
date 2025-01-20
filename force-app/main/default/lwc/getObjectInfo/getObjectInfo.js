import { LightningElement, wire } from 'lwc';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetObjectInfo extends LightningElement {

  defaultRecTypeId;
  ObjApiName

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    objFucntion({data, error}){
      if(data){
       // console.log('getObjectInfo Data is === ', data);

        this.defaultRecTypeId = data.defaultRecordTypeId;
        this.ObjApiName = data.apiName;

      }
    }
}