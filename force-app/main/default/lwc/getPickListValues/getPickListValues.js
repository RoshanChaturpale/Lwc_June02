import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues} from 'lightning/uiObjectInfoApi'
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry'
import TYPE_FIELD  from '@salesforce/schema/Account.Type'
import ACCOUNT_OBJECT from '@salesforce/schema/Account'

export default class GetPickListValues extends LightningElement {
    recotypeid;
    @wire(getObjectInfo, {objectApiName:ACCOUNT_OBJECT})
    objectInfo({data}){
        if(data){
            this.recotypeid = data.defaultRecordTypeId;
        }
    }

    @wire(getPicklistValues, { recordTypeId:'$recotypeid', fieldApiName:INDUSTRY_FIELD})
    industryPicklist({data, error}){
        if(data){
            console.log('piclisksdata is == ',data.values)
        }
        if(error){
            console.error(error)
        }
    }

}
