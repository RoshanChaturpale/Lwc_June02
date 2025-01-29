import { LightningElement, track} from 'lwc';

//import searchAccountData from '@salesforce/apex/accountData.searchAccountData';

export default class AccountSearchForm extends LightningElement {
    

    searchvalue;
    
    
    searchOnChangeHandler(event){
        this.searchvalue = event.target.value;
    }

    buttonhandleClick(){
       // console.log('this.searchValue', this.searchValue);
        this.dispatchEvent(new CustomEvent('searchaccountcontact', {detail: this.searchvalue}))
    }
}