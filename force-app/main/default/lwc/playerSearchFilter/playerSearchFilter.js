import { LightningElement, wire } from 'lwc';
import {NavigationMixin} from 'lightning/navigation';
import {getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import CricketerObject from '@salesforce/schema/Cricketers__c';
import Nationality_Field from '@salesforce/schema/Cricketers__c.Nationality__c';


export default class PlayerSearchFilter extends NavigationMixin(LightningElement) {

    recordTypeId;
    picklistValues;
    optionsArray;
    selectedCricketerNationality = 'Select Value';
    selectCrickerPlayerId;

    //call record api id
    @wire(getObjectInfo, {objectApiName: CricketerObject})
    ObjectInfos({data, error}){  

        if(error){
            console.log('error:' +JSON.stringify(error));
        }else if(data){

          //this.recordTypeId = data;
          //console.log('this.recordTypeId' +JSON.stringify(this.recordTypeId));

          //we add defaultRecordTypeId(record detail page id)
            this.recordTypeId = data.defaultRecordTypeId;
             console.log('this.recordTypeId'  + this.recordTypeId);
           // console.log('this.recordTypeId' +JSON.stringify(this.recordTypeId));

        }

    }

    //get picklist value
    @wire(getPicklistValues, {recordTypeId: '$recordTypeId' , fieldApiName: Nationality_Field})
    nationalityFieldValues({data, error}){

        if(error){
            console.log('error :' +JSON.stringify(error));

        }else if(data){
            let arr = [];

            //Complete Data Set
            //this.picklistValues = data;
            //onsole.log('data :' +JSON.stringify(this.picklistValues));


            //data values
            this.picklistValues = data.values;
            console.log('this.picklistValues :' +JSON.stringify(this.picklistValues));

           //foreach loop
            this.picklistValues.forEach( element =>{
                arr.push( {label : element.value , value : element.value } );
            })

            //store array value 
            this.optionsArray = arr;
            console.log('this.optionsArray' + JSON.stringify(this.optionsArray));

        }
    }
    

    //Navigation Item - call Cricket new record page
    createCricketers(){

        this[NavigationMixin.Navigate]({

            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Cricketers__c',
                actionName: 'new' 
            }
        })
    }


    handleOptionChanged(event){

        this.selectedCricketerNationality = event.detail.value;
        console.log('this.selectedCricketerNationality' + JSON.stringify(this.selectedCricketerNationality));


        //callchild Componet js method called searchCricketers
        this.template.querySelector('c-player-search-results').searchCricketers(this.selectedCricketerNationality);
    }

    handleCustomEvent(event){

        console.log('handleCustomEvent');

        this.selectCrickerPlayerId = event.detail.PlayerId;
        console.log(' this.selectCrickerPlayerId : ' +JSON.stringify( this.selectCrickerPlayerId));

    }
}