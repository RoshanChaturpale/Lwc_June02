import { LightningElement,api, track, wire } from 'lwc';

import getAccountData from '@salesforce/apex/accountData.getAccountData';


const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name',  },
    { label: 'Industry', fieldName: 'Industry', type: 'Picklist' },
    {label : 'Actions' ,type: 'button', typeAttributes: {
        label : 'View Contacts',
        name : 'view Contacts',
        title : 'View Contacts',
        value: 'View_Contacts',
    } }
];

export default class AccountDataResult extends LightningElement {

     columns = columns;

    @api searchtext;
    accountData = [];

    @wire(getAccountData, {textkey : '$searchtext'})
    getData({data}){
        if(data){
            //console.log('Account Data ===>  ' ,data);
            this.accountData = data;
        }
    }




}