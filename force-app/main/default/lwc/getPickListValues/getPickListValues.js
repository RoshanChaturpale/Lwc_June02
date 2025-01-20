import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues} from 'lightning/uiObjectInfoApi'
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry'
import TYPE_FIELD  from '@salesforce/schema/Account.Type'
import ACCOUNT_OBJECT from '@salesforce/schema/Account'

export default class GetPickListValues extends LightningElement {
    recotypeid;

    selectedIndustry = '';
    IndustryOptions = [];

    @wire(getObjectInfo, {objectApiName:ACCOUNT_OBJECT})
    objectInfo({data}){
        if(data){
            this.recotypeid = data.defaultRecordTypeId;
        }
    }

    @wire(getPicklistValues, { recordTypeId:'$recotypeid', fieldApiName:INDUSTRY_FIELD})
    industryPicklist({data, error}){
        if(data){
           // console.log('piclisksdata is == ',data.values);
            this.IndustryOptions =  [...this.generatePicklist(data)];
        }
    }


    

    generatePicklist(data){
        return data.values.map(item => ({label:item.label, value:item.value}))

    }

    handleChange(event){
        this.selectedIndustry = event.detail.value;
    }



 childHandller(){
    this.template.querySelector('c-child-comp').methodName();
 }

}
