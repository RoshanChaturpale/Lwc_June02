import { LightningElement, api,wire } from 'lwc';
import Id from '@salesforce/user/Id';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAccount from "@salesforce/apex/adminPortalDetailPageClass.getAccount";
import {getRecord} from 'lightning/uiRecordApi';



export default class NavigateToAccountDetail extends LightningElement {



  //  AccList=[];
     account;
    rid;
    userId=Id;
    uid;
    userdetails;
    recordId;
    // objectName = ACCOUNT_OBJECT;
    //fieldslist = [NAME_FIELD, INDUSTRY_FIELD, ANNUAL_REVENUE_FIELD];
    @api objectApiName = 'Account';
/*
    connectedCallback() {
        console.log('experience cloud lwc');
        console.log('$userId:'+this.userId);
      }
     
*/
    navigateToAccountDetail() {
        if (this.recordId) {
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.recordId, // Use the dynamic record ID
                    objectApiName: 'Account',
                    actionName: 'view'
                }
            });
            console.log('inside navigation method');
        } else {
            console.error('Record ID is not available.');
        }
    }

@wire(getAccount,{userId:'$userId'}) 
    wiredAccounts(result) {
       if (result.data) {
        console.log("AccList ", JSON.stringify(result.data));
        this.account = result.data;
        console.log('this.account');
        console.log(this.account);
         console.log(typeof this.account);
         this.recordId=result.data.Id;
          console.log(this.recordId);
       
        this.navigateToAccountDetail();
       }
    
        else if (result.error) {
        console.log(error);
       }

    }


  
    updatehandler(event) {
        this.dispatchEvent(new ShowToastEvent({
            title: "Record Created",
            message: "Record Created with ID: " + event.detail.id,
            variant: "success"
        }));
    }

   /*  @wire(getRecord,{recordId:'$userId',fields:['user.Name','user.Email']}) 
    wireduserdetails(data,error) {
        if (data && data.length > 0) {
             //console.log("UserData1 ", data);
             console.log("UserData2 ", data.fields);
            this.userdetails =data.fields;
          // this.uid=data.Id;
           // this.uid=data.Id.value;
          // console.log("uid ", this.uid);
        } else if (error) {
            console.log(error);
        } 
    } 
    */

}