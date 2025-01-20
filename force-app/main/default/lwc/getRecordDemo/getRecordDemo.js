import { api, LightningElement, wire } from 'lwc';
import { getRecord , getFieldValue, getFieldDisplayValue} from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import Acc_Rating from '@salesforce/schema/Account.Rating';
import Acc_annreve from '@salesforce/schema/Account.AnnualRevenue';


export default class GetRecordDemo extends LightningElement {

   @api recordId;
   name;
   rating;
   annRev;

    @wire(getRecord , {recordId : '$recordId' , fields:[NAME_FIELD, Acc_Rating, Acc_annreve]})
    getData({data}){
        if(data){
            //console.log('getRecord data ===>' , data);

            this.name = getFieldValue(data, NAME_FIELD);
            this.rating = getFieldValue(data, Acc_Rating);
            this.annRev = getFieldDisplayValue(data, Acc_annreve);

        }
    }
}