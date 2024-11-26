import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import { refreshApex } from "@salesforce/apex";
import { updateRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import Contact from '@salesforce/schema/Contact';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Title from '@salesforce/schema/Contact.Title';
import Phone from '@salesforce/schema/Contact.Phone';
import Email from '@salesforce/schema/Contact.Email';
import Id from "@salesforce/schema/Contact.Id";


 
  const COLS = [
    {label: "First Name", fieldName: 'FirstName', Type: 'Text', editable: true},
    {label: "Last Name", fieldName: 'LastName', Type: 'Text', editable: true},
    {label: "Title", fieldName: 'Title', Type: 'Title', editable: true}, 
    {label: "Phone", fieldName: 'Phone', type: "phone", editable: true},
    {label: "Email", fieldName: 'Email', type: "email", editable: true},
];

export default class DatatableInlineEditWithUiApiWithContact extends LightningElement {

    @track recordId;
    columns = COLS;
    draftValues = [];

    

    @wire(getContacts, { accId: "$recordId" }) contacts;

  async handleSave(event) {
    // Convert datatable draft values into record objects
    const records = event.detail.draftValues.slice().map((draftValue) => {
      const fields = Object.assign({}, draftValue);
      return { fields };
    });

    // Clear all datatable draft values
    this.draftValues = [];

    try {
      // Update all records in parallel thanks to the UI API
      const recordUpdatePromises = records.map((record) => updateRecord(record));
      await Promise.all(recordUpdatePromises);

      // Report success with a toast
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Success",
          message: "Contacts updated",
          variant: "success",
        }),
      );

      // Display fresh data in the datatable
      await refreshApex(this.contacts);
    } catch (error) {
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error updating or reloading contacts",
          message: error.body.message,
          variant: "error",
        }),
      );
    }
  }

}