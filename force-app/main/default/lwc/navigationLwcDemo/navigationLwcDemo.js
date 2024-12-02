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
            type :'standard__objectPage',   //target Object
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

    
    //Navigate to a Record Detail Page with "View" Mode or "edit" mode (Account record detail page)
    NavigatRecordDetailPage(){ 

        this[NavigationMixin.Navigate]({
            type :'standard__recordPage',    //target record page
            attributes :{
                recordId : '0015i00000en9pgAAA',    //currently add hard codded id
                objectApiName : 'Account',
                actionName : 'view'     //view or edit - two options
            },
         })
    }

    // Create New Record
    NavigateCreateNewAccountRecord(){

        this[NavigationMixin.Navigate]({
            type :'standard__objectPage',    //target Create New AccountPAge
            attributes :{
                objectApiName : 'Account',
                actionName : 'new'     //new
            },
            state : {
                recordId : '012J3000000L3WCIA0',   //record types id
            }
         })

    }



    //
    urlExternalSite(){

        this[NavigationMixin.Navigate]({
            type :'standard__webPage',    
            attributes :{
                url : 'https://www.google.com'
                
            }
         })

    }

    //
    showfile() {
        this[NavigationMixin.Navigate]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'filePreview'
            },
            state: {
                recordIds: '069J3000005ej7WIAQ', // Comma-separated IDs
                //selectedRecordId: '069J3000005ej7WIAQ' // Show first file
            }
        });
    }




}