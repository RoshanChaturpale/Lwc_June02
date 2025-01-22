import { LightningElement ,wire} from 'lwc';
import { getPicklistValues, getObjectInfo } from 'lightning/uiObjectInfoApi';
import CAR_OBJECT from '@salesforce/schema/Car__c'
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';
import MAKE_FIELD from '@salesforce/schema/Car__c.Make__c';


const CATEGORY_ERROR = 'Error Loading Categories';
const MakeTypeError='Error Loading Make Tpye';
export default class CarFilter extends LightningElement {

 filter={
    searchKey:'',
    maxPrice:999999,
 }
 categoryError=CATEGORY_ERROR;
 makeError = MakeTypeError;


 @wire(getObjectInfo, {objectApiName:CAR_OBJECT})
 carObjectInfo

 @wire(getPicklistValues, {recordTypeId: '$carObjectInfo.data.defaultRecordTypeId', fieldApiName:CATEGORY_FIELD})
 categories;


 @wire(getPicklistValues, {recordTypeId: '$carObjectInfo.data.defaultRecordTypeId', fieldApiName:MAKE_FIELD})
 makeType;

    
 
 
 handleSearchKeyChange(event){

   this.filter.searchKey =event.target.value;
   console.log('handleSearchKeyChange is=== ' , this.filter.searchKey);


    }

    handleMaxPriceChange(event){

        this.filter.maxPrice = event.target.value;
        console.log('handleSearchKeyChange is=== ' ,this.filter.maxPrice);




    }


    //for Category
    handleCheckbox(event){

        const {name, value} = event.target.dataset;
        console.log('name', name);
        console.log('value', value);


    }
}