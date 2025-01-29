import { LightningElement,api, track, wire } from 'lwc';

import getAccountData from '@salesforce/apex/accountData.getAccountData';
import Title from '@salesforce/schema/Contact.Title';


const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name',  },
    { label: 'Industry', fieldName: 'Industry', type: 'Picklist' },
    { label: 'Phone', fieldName: 'Phone', type: 'Phone' },
    {label : 'Actions' ,type: 'button', typeAttributes: {
        label : 'View Contacts',
        name : 'view Contacts',
        title : 'View Contacts',
        value: 'View_Contacts',
    } }
];

export default class AccountDataResult extends LightningElement {


    @track message = '';
    saveData=[];
    columns = columns;

    // Method to receive and display message from Parent
    @api showMessage(msg) {
        this.message = msg;

        getAccountData({textkey : this.message})
        .then(result => {
           // console.log('data is === ', result);
           this.saveData = result;

            
        }).catch(errro => {
            console.log('error is found ');
        });
    }


        
        

    // @wire(getAccountData , {textkey : '$this.message'})
    // wiredData({data,error}){
    //     if(data){
    //         console.log('data is === ' ,data);
    //     }
    //     if(error){
    //         console.log('error is found');
    //     }
    // }
}