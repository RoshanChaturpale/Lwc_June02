import { api, LightningElement, track, wire } from 'lwc';
import getAllObjects from '@salesforce/apex/objectpicklistController.getAllObjects';

export default class ObjectsPicklists extends LightningElement {
    @track objectOptions = [];
     @api selectedObject = '';

    @wire(getAllObjects)
    wiredObjects({ error, data }) {
        if (data) {
            this.objectOptions = data.map(obj => ({ label: obj, value: obj }));
        } else if (error) {
            console.error('Error fetching objects:', error);
        }
    }

    handleChange(event) {
        this.selectedObject = event.detail.value;
        console.log('Selected Object:', this.selectedObject);

        // Dispatch event to parent
        // Dispatch event with selected object name
        this.dispatchEvent(new CustomEvent('objectselected', { 
            detail: { selectedObject: this.selectedObject } 
        }));
    }
    }
}
