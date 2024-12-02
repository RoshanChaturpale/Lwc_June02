import { LightningElement ,track} from 'lwc';
import imperative_getAccountData from '@salesforce/apex/accountData.imperative_getAccountData';


const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Rating', fieldName: 'Rating', type: 'picklist' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
]


export default class ImperativeDemo extends LightningElement {

    @track columns = columns;
    @track data = [];

    connectedCallback(){

        imperative_getAccountData()
        .then(result => {
            this.data = result;
        })
        .catch(error => {
            console.log('error occured');
    
        })

    }

   



}