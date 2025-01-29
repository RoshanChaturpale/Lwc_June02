import { LightningElement ,api} from 'lwc';

export default class AccountSearch extends LightningElement {
    
    @api searchvalue='';
    



    SearchAccountContactHandler(event){
        this.searchvalue = event.detail;
        //console.log('fgfff', this.searchvalue);

    }
}