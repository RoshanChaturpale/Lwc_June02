import { LightningElement, api, wire } from 'lwc';
import { getRecordNotifyChange, getRecord } from 'lightning/uiRecordApi';
import getRecentlyAddedContact from '@salesforce/apex/ContactNotifierController.getRecentlyAddedContact';

export default class PopupNotifier extends LightningElement {
    @api recordId; // Account Record ID
    @api userId; // Logged-in User ID
    showPopup = false; // To control popup visibility
    contactName = ''; // Name of the newly added contact

    connectedCallback() {
        // Polling every 10 seconds to check for new contacts
        this.polling = setInterval(() => {
            this.checkForNewContacts();
        }, 10000);
    }

    disconnectedCallback() {
        clearInterval(this.polling); // Stop polling when component is destroyed
    }

    async checkForNewContacts() {
        try {
            const contact = await getRecentlyAddedContact({ accountId: this.recordId, userId: this.userId });
            if (contact) {
                this.contactName = contact.Name;
                this.showPopup = true;
            }
        } catch (error) {
            console.error('Error fetching contact:', error);
        }
    }

    refreshPage() {
        getRecordNotifyChange([{ recordId: this.recordId }]); // Refreshes the record
        window.location.reload(); // Reloads the page
    }
}
