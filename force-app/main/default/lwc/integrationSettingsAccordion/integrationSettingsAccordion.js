import { LightningElement, wire } from 'lwc';
import getIntegrationSettings from '@salesforce/apex/IntegrationSettingsController.getIntegrationSettings';



const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'API Token', fieldName: 'API_Token__c' },
    { label: 'Endpoint', fieldName: 'Endpoint__c' },
    { label: 'Username', fieldName: 'Username__c' },
    { label: 'Method', fieldName: 'Method__c' },
    {label: 'CRM Customer', fieldName: 'CRM_Customer__c'}
];


export default class IntegrationSettingsAccordion extends LightningElement {
   columns = COLUMNS;
    integrationData;

    @wire(getIntegrationSettings)
    wiredIntegrationSettings({ error, data }) {
        if (data) {
            this.integrationData = data;
        } else if (error) {
            console.error('Error retrieving integration settings: ', error);
        }
    }
}