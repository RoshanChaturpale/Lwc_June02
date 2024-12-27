import { LightningElement, track } from 'lwc';
import accountCreationMethodForCrud from '@salesforce/apex/AccountProvider.accountCreationMethodForCrud';
import searchAccount from '@salesforce/apex/AccountProvider.searchAccount';

searchAccount
// import  AccObject from '@salesforce/schema/Account';
// import  AccountName from '@salesforce/schema/Account.Name';
// import  AccountRating from '@salesforce/schema/Account.Rating';
// // import  AccountEmail from '@salesforce/schema/Account.Account_Email__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'


const columns = [
    { label: 'Account Name', fieldName: 'Name' },
    { label: 'Rating', fieldName: 'Rating', type: 'Picklist' }
];



export default class CrudComponent extends LightningElement {

    columns = columns;

    // Account_Object = AccObject;
    // Account_Name = AccountName;
    // Account_Rating = AccountRating;
    // // Account_Email = AccountEmail;

    accountObj={'sObjectType':'Account'}


    @ track Data;
    //if:true 
    @track showInputFieldFlag = false;
    @track showSaveButtonFlag = false; 
    @track showSearchNowButtonFlag = false;

    nameHandler(event){
        this.accountObj.Name = event.target.value;
    }

    ratingHandller(event){
        this.accountObj.Rating = event.target.value;
    }



    createButtonHandller(){
        console.log('im in createButtonHandller');
        this.showInputFieldFlag = true;
        this.showSaveButtonFlag = true;
        
    }
    searcheButtonHandller(){
        this.showInputFieldFlag = false;
        this.showSearchNowButtonFlag = true;
        this.showSaveButtonFlag = false;



    }


        //Create Record
       saveButtonHandler(){
        accountCreationMethodForCrud({objAcc: this.accountObj})
        .then(result => {
            this.showSuccessToast();
        })
    }

    //showToast with  Insert
    showSuccessToast(){
        const evt = new ShowToastEvent({
          title : 'Messege',
          message: this.accountObj.Name+'Record is Inserted...!!!',
            variant: 'warning',
            mode: 'dismissable'
        })
        this.dispatchEvent(evt);
    }


    //Search Accounnt Data
    searcNowButtonHandler(){

        console.log('im in searcNowButtonHandler' , this.accountObj.Name);

        searchAccount({objAcc: this.accountObj})
        .then(result => {
            this.Data = result;
        })
        .catch(Error =>{
            console.log('error is found');
        })


    }



}