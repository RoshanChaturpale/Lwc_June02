import { LightningElement, wire } from 'lwc';
import Id from '@salesforce/user/Id';
import { getRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/User.Name';
import EMAIL_FIELD from '@salesforce/schema/User.Email';



fields = [NAME_FIELD, EMAIL_FIELD];


export default class WireDemoUserDetails extends LightningElement {


    userId = Id;

    @wire(getRecord, {recordId : '$userId', fields})
    ad(data){
        console.log('user info is ==> ',data);
    }
}
