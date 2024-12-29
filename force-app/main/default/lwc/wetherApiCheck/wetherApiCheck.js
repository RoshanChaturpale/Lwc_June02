import { LightningElement, track } from 'lwc';
import whetherApi from '@salesforce/apex/WhetherApiCheck.whetherApi';

export default class WetherApiCheck extends LightningElement {



    @track Name;

    weatherIcon;
    weatherText;

    searchWetherReport(event){

        this.Name = event.target.value;
       // console.log(this.Name);


    }

    ONClickHnadller(){

        //console.log(this.Name);
        whetherApi({name : this.Name})
        .then(res => {
           let storeData = JSON.parse(res);
           this.weatherIcon = storeData.current.condition.icon;
           this.weatherText = storeData.current.condition.text;

        })
    }
}