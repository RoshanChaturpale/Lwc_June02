import { LightningElement ,wire} from 'lwc';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetPickListValuesByRecordTypeid extends LightningElement {

    RatingData = ''
    IndustryData = ''
    RatingValue;
    IndustryValue;

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    wireasProperty


    @wire(getPicklistValuesByRecordType , {objectApiName: ACCOUNT_OBJECT ,recordTypeId : '$wireasProperty.data.defaultRecordTypeId'})
    wireasaFuction({data, error}){

        if(data){
            console.log('getPicklistValuesByRecordType data is ==' ,data);
            this.RatingData = this.dataHandller(data.picklistFieldValues.Rating);
            this.IndustryData = this.dataHandller(data.picklistFieldValues.Industry);
        }

    }


    dataHandller(data){
      return  data.values.map(item => ({"label":item.label, "value":item.value}))
}
handleChange(event){
    this.RatingValue = event.detail.value;

}
handleChangeIndustry(event){
    this.IndustryValue = event.detail.value;
}


}