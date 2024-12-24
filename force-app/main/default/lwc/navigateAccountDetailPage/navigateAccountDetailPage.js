import { LightningElement, api, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';


export default class NavigateAccountDetailPage extends LightningElement {

navigateToRecord(event) {
    const recordId = event.currentTarget.dataset.id;
    
    this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            recordId: recordId,
            actionName: 'view'
        }
    });
}
}