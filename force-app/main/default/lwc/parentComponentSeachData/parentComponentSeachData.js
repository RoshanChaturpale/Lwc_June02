import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class ParentComponentSeachData extends NavigationMixin(LightningElement) {

     fname;


    onChangeEventHandler(event){

        this.fname = event.target.value;
       // console.log('this.fname' , this.fname);
       
        this.template.querySelector('c-child-component-show-data').handleChildRecord(this.fname);
    }

    NavigateCreateNewAccountRecord(){

        this[NavigationMixin.Navigate]({
            type :'standard__objectPage',    //target Create New AccountPAge
            attributes :{
                objectApiName : 'Account',
                actionName : 'new'     //new
            },
            state : {
                recordId : '012J3000000L3WCIA0',   //record types id  - Account, Lottoland, LMS-UAT
            }
         })
    }





}