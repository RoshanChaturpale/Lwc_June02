import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigationLwcDemo extends NavigationMixin(LightningElement) {
    onClickHandler() {
        // Navigate to a Lightning App page using the NavigationMixin
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage', // Ensure the 'type' attribute is correctly spelled
            attributes: {
                apiName: 'Cricketers' // Replace 'Cricketers' with the exact API Name of your Lightning App page
            }
        });
    }


    //Navigate to a Object Page (Account Object Home Page)
    onClickObectPage(){

        this[NavigationMixin.Navigate]({
            type :'standard__objectPage',
            attributes :{
                objectApiName : 'Account',
                actionName : 'home',
            },
         })
    }


    //Navigate to a Object Page List (like - All Accounts, Recently Viewwed)
    onClickObectPageList(){ 

        this[NavigationMixin.Navigate]({
            type :'standard__objectPage',
            attributes :{
                objectApiName : 'Account',
                actionName : 'list'
            },
            //for List
            state : {
                filterName : 'Recent' 
                //or  
                //filterName : 'All_Account_Records'   ....check Object List Url
            }
         })
    }

    
    //Navigate to a Record Detail Page with View Mode (Account record detail page)
    NavigatRecordDetailPage(){ 

        this[NavigationMixin.Navigate]({
            type :'standard__recordPage',
            attributes :{
                recordId : '0015i00000en9pgAAA',    //currently add hard codded id
                objectApiName : 'Account',
                actionName : 'view'     //view and edit - two options
            },
         })
    }


    




}
