import { LightningElement, api, wire ,track} from 'lwc';
import getAccountData from '@salesforce/apex/apexClass_practice_LWC.getAccountData';
import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';


export default class ChildComponentShowData extends LightningElement {

    holdParentData; // Reactive property for parent data
    @api accountData;           // Holds fetched account data
    error;                 // Holds error if any
    fldsItemValues = [];


    // Columns for the lightning-datatable
    columns = [
        { label: 'Account ID', fieldName: 'Id', type: 'text'},
        { label: 'Name', fieldName: 'Name', type: 'text' , editable: true,},
        { label: 'Industry', fieldName: 'Industry', type: 'text' , editable: true, },
        { label: 'Phone', fieldName: 'Phone', type: 'Phone' , editable: true,}

    ];

    @api handleChildRecord(receivedParentData) {
        //console.log('Received Parent Data:', JSON.stringify(receivedParentData));
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

    saveHandleAction(event) {
        this.fldsItemValues = event.detail.draftValues;
        const inputsItems = this.fldsItemValues.slice().map(draft => {
            const fields = Object.assign({}, draft);
            return { fields };
        });
 
 
        const promises = inputsItems.map(recordInput => updateRecord(recordInput));
        Promise.all(promises).then(res => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Records Updated Successfully!!',
                    variant: 'success'
                })
            );
            this.fldsItemValues = [];
            return this.refresh();
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'An Error Occured!!',
                    variant: 'error'
                })
            );
        }).finally(() => {
            this.fldsItemValues = [];
        });
    }
 
 
    async refresh() {
        await refreshApex(this.accountData);
    }
}