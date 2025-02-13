import { api, LightningElement,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
//import Field from '@salesforce/schema/AccountHistory.Field';


export default class GetRecordUiAdapter extends LightningElement {

    @api recordId;

    @wire(getRecord, { recordId: '$recordId', layoutTypes: 'Full' , modes:'Edit' })
     wireFunction({data,error}){
        if(data){
            //console.log('get Record Data is ', data);
        }
     }
}

