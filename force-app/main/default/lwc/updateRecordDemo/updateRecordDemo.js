import { LightningElement, wire } from 'lwc';
import { getListUi } from 'lightning/uiListApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import {updateRecord} from 'lightning/uiRecordApi';


const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    { label: 'Phone', fieldName: 'Phone', editable:true},
    { label: 'Email', fieldName: 'Email',  type:'email', editable:true},
   
];


export default class UpdateRecordDemo extends LightningElement {

    columns = columns;
    contactsData = [];

    draftValues = [];

    pageToken;
    previousToken;
    nextToken;

    @wire(getListUi, {objectApiName : CONTACT_OBJECT, listViewApiName : 'AllContacts' ,pageSize :10, pageToken: '$pageToken'})
    wiredFunction({data, error}){
        if(data){
            console.log('getListInfo Data is - UpdateRecordDemo ===' ,data);
            this.contactsData = data.records.records.map(items => {
                return {
                    "Id" : this.getValue(items, 'Id'),
                    "Name" : this.getValue(items, 'Name'),
                    "Phone" : this.getValue(items, 'Phone'),
                    "Email" : this.getValue(items, 'Email')
                }
            })

            //next and previous button
            this.nextToken = data.records.nextPageToken;
         this.previousToken = data.records.previousPageToken;
        }  
        if(error){
            console.log('getlistInof Data is ===>' , error);
        }
     }


     getValue(data,field){
        return data.fields[field].value;
     }

     handleSave(event){

        console.log(event.detail);

       // const recordInput = {objectApiName : CONTACT_OBJECT ,}

       const recordInput = event.detail.draftValues.map(draft =>
        {const fields={...draft}

        return {fields : fields}
    
    })

     

      const promises =  recordInput.map(recordInput =>  updateRecord(recordInput))
      promises.all(promises)
      .then(()=>{
        console.log('Contact Updated Successfully..');
        this.draftValues=[];
      }).catch(error => {
        console.log('error is found');
      })





       

     }



     //previou and next button
     handlePrevious(){

        this.pageToken = this.previousToken;

    }
    handleNext(){

        this.pageToken = this.nextToken;

    }
}