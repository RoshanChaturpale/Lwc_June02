import { LightningElement ,api, track} from 'lwc';

export default class ObjectPicklistParent extends LightningElement {

    @track sendDataObjectPicklistChild = ''; // Use @track

    objectPicklistHandler(event) {
        this.sendDataObjectPicklistChild = event.detail;
        console.log('Selected Object in Parent:', this.sendDataObjectPicklistChild);
    }
}