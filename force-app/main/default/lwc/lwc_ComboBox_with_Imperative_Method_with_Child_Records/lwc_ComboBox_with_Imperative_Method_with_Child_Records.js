import { LightningElement ,track} from 'lwc';
import comboBoxDemo_getAccount from '@salesforce/apex/accountData.comboBoxDemo_getAccount';
import comboBoxDemo_getContactRecords from '@salesforce/apex/accountData.comboBoxDemo_getContactRecords';

import Json_format from '@salesforce/resourceUrl/Json_format';


const columns = [
    {label : 'Contact Name' , fieldName : 'Name'},
    {label : 'Contact Email' , fieldName : 'Email'},
]

export default class Lwc_ComboBox_with_Imperative_Method_with_Child_Records extends LightningElement {

    @track value = '';
    @track accOption = [];
    @track cardVisible = false;
    @track data = [];
    @track columns = columns;


    get options(){
        return this.accOption;
    }


    connectedCallback(){

        comboBoxDemo_getAccount()
        .then(result => {
            let arr = [];
            for(var i=0; i<result.length; i++){
                arr.push({label : result[i].Name , value : result[i].Id })
            }
            this.accOption = arr;
            //console.log('this.accOption' +JSON.stringify(this.accOption));
        })
        .catch(error => {
            console.log('error is found');
        })


    }

    handleChange(event){

        this.cardVisible = true;

        this.value = event.detail.value;
        console.log(' this.value ======>>>>>>>>>>' +JSON.stringify( this.value));

        comboBoxDemo_getContactRecords({accId : this.value})
        .then(result => {
            this.data = result;
        })
        .catch(error => {
            console.log('error is Found');
        })

    }
}