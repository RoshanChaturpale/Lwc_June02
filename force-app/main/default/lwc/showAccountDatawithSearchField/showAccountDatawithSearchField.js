import { LightningElement, track, wire } from 'lwc';
import searchAccountData from '@salesforce/apex/accountData.searchAccountData';
import getAccountData from '@salesforce/apex/accountData.getAccountData';

export default class ShowAccountDatawithSearchField extends LightningElement {

    // @track a;

    // @wire(searchAccountData)  searchData;

    // onChangeEventwithSearch(event){

    // console.log('im in onChangeEventwithSearch method');

    // this.a = event.target.value;
    // console.log('the value of a is ==>' , this.a);

    // }

    searchKey;
    @track accounts;
    //This Funcation will get the value from Text Input.
    handelSearchKey(event){
        this.searchKey = event.target.value;
    }

    //This funcation will fetch the Account Name on basis of searchkey
    SearchAccountHandler(){
        //call Apex method.
        getAccountData({textkey: this.searchKey})
        .then(result => {
                this.accounts = result;
        })
        .catch( error=>{
            this.accounts = null;
        });

    }
    cols = [
        {label:'Account Name', fieldName:'Name' , type:'text'} ,
        {label:'Phone', fieldName:'Phone' , type:'Phone'} ,
        {label:'Industry', fieldName:'Industry' , type:'text'}
              
    ]

    
}