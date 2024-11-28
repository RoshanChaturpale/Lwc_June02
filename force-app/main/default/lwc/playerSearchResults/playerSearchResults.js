import { LightningElement, wire } from 'lwc';
import getCricketerList from '@salesforce/apex/apexClass_practice_LWC.getCricketerList'

export default class PlayerSearchResults extends LightningElement {

    cricketersData;

    @wire(getCricketerList) 
    wiredCricketers({error,data}){

        if(error){
            console.log('error:' +JSON.stringify(error));
        }else if(data){
            this.cricketersData = data;
            console.log('this.cricketersData:' +JSON.stringify(this.cricketersData));
        }
    }
}