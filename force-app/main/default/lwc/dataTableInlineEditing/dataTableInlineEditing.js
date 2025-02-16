import { LightningElement,wire } from 'lwc';
import contactList from '@salesforce/apex/ContactData.contactList';
import { updateRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

const COLUMNS = [
    { label: 'First Name', fieldName: 'FirstName', editable: true},
    { label: 'Last Name', fieldName: 'LastName', editable: true },
    { label: 'Email', fieldName: 'Email', editable: true },
  ];

export default class DataTableInlineEditing extends LightningElement {

    columns = COLUMNS;

  data = [];
  //Storing draft values for inline editing
  draftValues = [];
  wiredContacts;

  //Fetches the contact detail using Apex wire service
  @wire(contactList)
  contacts(result){
    this.wiredContacts = result;  // For refresh apex
    const {data, error} = result;
    if(data){
      this.data = data;
    }else if(error){
      console.error(error);
    }
  }


  handleSave(event){
    this.draftValues = event.detail.draftValues;
    console.log('this.draftvalue is ==>' , this.draftValues);


    updateRecord(recordInput)

  }




}