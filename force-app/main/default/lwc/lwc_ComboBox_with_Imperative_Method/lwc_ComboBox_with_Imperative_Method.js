import { LightningElement, track } from 'lwc';
import comboBoxDemo_getAccount from '@salesforce/apex/accountData.comboBoxDemo_getAccount';

export default class Lwc_ComboBox_with_Imperative_Method extends LightningElement {

    @track value = '';
    @track accOption = [];

    get options(){
        return this.accOption;
    }

    connectedCallback(){
        
        comboBoxDemo_getAccount()
        .then(result => {
            let arr = [];
            for(var i=0; i<result.length; i++){
                arr.push({label : result[i].Name , value : result[i].Id})
            }
            this.accOption = arr;
            console.log('this.accOption ' +JSON.stringify(this.accOption ));
        })
        .catch(error => {
            console.log('error is found');
        })
    }

    handleChange(event){
        this.value = event.detail.value;
    }


}