import { LightningElement, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';



export default class Lightining_data_services extends LightningElement {

   
       fields = [NAME_FIELD,PHONE_FIELD,EMAIL_FIELD];
    
    @api recordId;
    @api objectApiName;
       

}