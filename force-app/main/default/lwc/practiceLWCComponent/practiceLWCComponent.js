import { api, LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import Acc_Name from '@salesforce/schema/Account.Name';
import Acc_Email from '@salesforce/schema/Account.Account_Email__c';

//user Details
import USER_ID  from '@salesforce/user/Id';
import NAME_FIELD from '@salesforce/schema/User.Name';
import EMAIL_FIELD from '@salesforce/schema/User.Email';


//metadata
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

//getFieldValue
import { getFieldValue, getFieldDisplayValue } from 'lightning/uiRecordApi';



import { getRecord } from 'lightning/uiRecordApi';
export default class PracticeLWCComponent extends LightningElement {

    @api recordId;
    UserEmail;
    UserName;

    rating;

    @wire(getRecord, {recordId : '$recordId', fields:[RATING_FIELD]})
    getAccountRecord({data, error}){
        if(data){
            console.log('data is ===------->', data);
         this.rating = data.fields.Rating.value;
         console.log('Account Rating is ====----' , this.rating);
        }else if (error) {
            console.error('Error fetching account rating:', error);
        }
    }


    userId  = USER_ID ;
    UserEmail;
    UserName;
    UserId;


    @wire(getRecord, { recordId: '$userId', fields: [NAME_FIELD, EMAIL_FIELD] })
    wiredUser({ data, error }) {
        if (data) {
            console.log('Logged-in user data:', data);
            this.UserEmail = data.fields.Email.value;
            this.UserName = data.fields.Name.value;
            this.UserId = data.id;
            console.log('this.UserName------>', this.UserName);
            console.log('this.UserName ----->', this.UserEmail);

        } else if (error) {
            console.error('Error fetching user data:', error);
        }
    }


    //for metadata
    @wire(getObjectInfo, {objectApiName : ACCOUNT_OBJECT})
    wiredasaFunction({data,error}){
        if(data){
            console.log('meta data is ====>' , data);
        }
    }


            rating;
            Name;
            Email; 

    //getFieldValue
    @wire(getRecord, {recordId : '$recordId', fields:[RATING_FIELD, Acc_Name, Acc_Email]})
    wiredReordData({data,error}){
        if(data){
            console.log('getFieldValue is ' , data);
            this.rating = getFieldValue(data,RATING_FIELD);
            this.Name = getFieldValue(data, Acc_Name);
            this.Email = getFieldValue(data, Acc_Email);

        }
        if(error){
            console.error('error is found' , error);
        }
    }

    
}