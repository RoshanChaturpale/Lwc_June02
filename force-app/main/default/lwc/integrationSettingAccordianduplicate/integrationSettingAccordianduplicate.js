import { LightningElement } from 'lwc';
import saveIntegrationSettings from '@salesforce/apex/IntegrationSettingsController.saveIntegrationSettings';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class IntegrationSettingAccordianduplicate extends LightningElement {
   name = '';
    apiName = '';
    endpoint = '';
    token = '';
    username = '';
    password = '';
    crmcustomer = '';
    method = '';
    methodIsInvalid = false;


    crmcustomeroptions = [
        { label: 'Inverite', value: 'Inverite' },
        { label: 'Flinks', value: 'Flinks' },
        { label: 'Pandadoc', value: 'Pandadoc' }
    ];

    methodOptions = [
        { label: 'GET', value: 'GET' },
        { label: 'POST', value: 'POST' },
        { label: 'PUT', value: 'PUT' },
        { label: 'PATCH', value: 'PATCH' },
        { label: 'DELETE', value: 'DELETE' }
    ];

    handleInputChange(event) {
        const field = event.target.dataset.id;
        if (field) {
            this[field] = event.target.value;
        }
    }

    //CRM CustomerPicklist
    handleMethodChangee(event) {
        this.crmcustomer = event.target.value;
    }

 

    //Method PickList
    handleMethodChange(event) {
        this.method = event.target.value;
      // this.methodIsInvalid = false; // Reset validation when the field is changed

    }

    handleSave() {


        //Validaton with Crm Customer Picklist
         //Validation with Method Picklist
        if (!this.crmcustomer) {
            this.methodIsInvalid = true; // Mark the field as invalid
            this.showToast('Error', 'The "Crm Customer" field is required.', 'error');
            return; // Stop the save process if validation fails
        }

        //Validation with Method Picklist
        if (!this.method) {
            this.methodIsInvalid = true; // Mark the field as invalid
            this.showToast('Error', 'The "Method" field is required.', 'error');
            return; // Stop the save process if validation fails
        }


        saveIntegrationSettings({ 
            name: this.name, 
            apiName: this.apiName, 
            endpoint: this.endpoint, 
            token: this.token, 
            username: this.username, 
            password: this.password, 
            crmcustomer:this.crmcustomer,
            method: this.method
        })
        .then(result => {
            this.showToast('Success', 'Integration Settings Saved', 'success');
            this.clearForm();
        })
        .catch(error => {
            this.showToast('Error', error.body.message, 'error');
        });
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(event);
    }

    clearForm() {
        this.name = '';
        this.apiName = '';
        this.endpoint = '';
        this.token = '';
        this.username = '';
        this.password = '';
        this.crmcustomer = '',
        this.method = '';
    }


    
}