import { LightningElement, wire } from 'lwc';
import { getListUi } from 'lightning/uiListApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
export default class GetListUIDemoLwc extends LightningElement {

    contactSaveData = [];
    pageToken = null;
    previousToken = null;
    nextToken = null;


    @wire(getListUi, {objectApiName : CONTACT_OBJECT, listViewApiName : 'AllContacts' , pageSize :10, pageToken: '$pageToken'})
    wireFunction({data, error}){
        if(data){
           console.log('getListUi data is ==> ' ,data);
           this.contactSaveData = data.records.records;
         //  console.log('this.contactSaveData is', this.contactSaveData);
         this.nextToken = data.records.nextPageToken;
         this.previousToken = data.records.previousPageToken;
        }
        if(error){
            console.error('getlistUi Error is found ===> ', error)
        }
    }

    handlePrevious(){

        this.pageToken = this.previousToken;

    }
    handleNext(){

        this.pageToken = this.nextToken;

    }
}