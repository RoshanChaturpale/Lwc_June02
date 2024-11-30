import { LightningElement, api, wire } from 'lwc';
import getAccountData from '@salesforce/apex/apexClass_practice_LWC.getAccountData';


export default class ChildComponentShowData extends LightningElement {

    holdParentData; // Reactive property for parent data
    accountData;           // Holds fetched account data
    error;                 // Holds error if any

    // Columns for the lightning-datatable
    columns = [
        { label: 'Account ID', fieldName: 'Id', type: 'text' },
        { label: 'Name', fieldName: 'Name', type: 'text' },
        { label: 'Industry', fieldName: 'Industry', type: 'text' },
        { label: 'Phone', fieldName: 'Phone', type: 'Phone' }

    ];

    @api handleChildRecord(receivedParentData) {
        console.log('Received Parent Data:', JSON.stringify(receivedParentData));
        this.holdParentData = receivedParentData;
    }

    @wire(getAccountData, { textkey: '$holdParentData' })
    wiredData({ data, error }) {
        if (data) {
            this.accountData = data;
            this.error = undefined;
            console.log('Fetched Data:', JSON.stringify(this.accountData));
        } else if (error) {
            this.error = error;
            this.accountData = undefined;
            console.error('Error:', this.error);
        }
    }
}