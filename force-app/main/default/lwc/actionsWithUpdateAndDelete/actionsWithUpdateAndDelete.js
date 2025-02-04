import { LightningElement } from 'lwc';



const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    { label: 'Account Email', fieldName: 'Account_Email__c', type: 'Email' },
    { 
        label: 'Update', 
        type: 'button', 
        typeAttributes: { 
            label: 'Update', 
            name: 'update', 
            title: 'Update Record', 
            value: 'update',
            variant: 'brand'
        } 
    },
    { 
        label: 'Delete', 
        type: 'button', 
        typeAttributes: { 
            label: 'Delete', 
            name: 'delete', 
            title: 'Delete Record', 
            value: 'delete',
            variant: 'destructive'
        } 
    }
];


export default class ActionsWithUpdateAndDelete extends LightningElement {


    columns = columns;
    UpdateVisible = false;

     data = [
        { Id: '001', Name: 'John Doe', Account_Email__c: 'john@example.com' },
        { Id: '002', Name: 'Jane Smith', Account_Email__c: 'jane@example.com' },
        { Id: '003', Name: 'Michael Johnson', Account_Email__c: 'michael@example.com' }
    ];


    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        
        switch (actionName) {
            case 'update':
                this.updateRecord(row);
                break;
            case 'delete':
                this.deleteRecord(row);
                break;
        }
    }
    
    updateRecord(row) {
        console.log('Updating Record:', row);
        // Add your logic to update the record (e.g., open modal or edit form)
        this.UpdateVisible = true;
    }
    
    deleteRecord(row) {
        console.log('Deleting Record:', row);
        // Add your logic to delete the record (e.g., call Apex method)
    }
    
}