import { LightningElement,api, track, wire } from 'lwc';

import getAccountData from '@salesforce/apex/accountData.getAccountData';

import { publish, MessageContext } from 'lightning/messageService';
import recordIdSelected from '@salesforce/messageChannel/viewAccountContactschannel__c';


const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name',  },
    { label: 'Account Email', fieldName: 'Account_Email__c', type: 'Email' },
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





    @wire(MessageContext)
    messageContext;

    onRowActionHandler(event){

        if(event.detail.action.value == 'View_Contacts'){

        const payload = { 
                          accountRecordId: event.detail.row.Id, 
                          accountName: event.detail.row.Name,
                          accountEmail: event.detail.row.Account_Email__c,
                        };

        publish(this.messageContext, recordIdSelected, payload);


        }

        

    }



}