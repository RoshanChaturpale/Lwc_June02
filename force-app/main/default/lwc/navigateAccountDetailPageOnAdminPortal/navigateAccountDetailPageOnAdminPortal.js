import { LightningElement, api,wire } from 'lwc';
import Id from '@salesforce/user/Id';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAccount from "@salesforce/apex/adminPortalDetailPageClass.getAccount";



export default class NavigateAccountDetailPageOnAdminPortal extends  NavigationMixin(LightningElement) {



 
    recordId;
    
    
    @api objectApiName = 'Account';

    
//  @wire(getAccount,{userId:'$userId'}) 
//     wiredAccounts(result) {
//        if (result.data) {
//         console.log("AccList ", JSON.stringify(result.data));
//         this.account = result.data;
//         console.log('this.account');
//         console.log(this.account);
//          console.log(typeof this.account);
//          this.recordId=result.data.Id;
//           console.log(this.recordId);
       
//         this.navigateToAccountDetail(this.recordId);
//        }
    
//         else if (result.error) {
//         console.log(error);
//        }
//   } 

     navigateToAccountDetail(accountId) {
        if(accountId!=null){
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: accountId, // Use the dynamic record ID
                    objectApiName: 'Account',
                    actionName: 'view'
                }
            });
            console.log('Inside navigation method');
        } else {
            console.error('Record ID is not available.');
        }
    }

    

}