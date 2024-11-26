import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import createContact from '@salesforce/apex/ContactController.createContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';

export default class ContactManager extends LightningElement {
    @track contacts;
    @track error;
    @track contact = {
        LastName: '',
        Email: ''
    };

    @wire(getContacts)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

    handleInputChange(event) {
        const field = event.target.name;
        this.contact[field] = event.target.value;
    }

    handleCreateContact() {
        createContact({ contact: this.contact })
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact created',
                        variant: 'success',
                    }),
                );
                this.contact = { LastName: '', Email: '' };
                return refreshApex(this.contacts);
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating contact',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
            });
    }
}