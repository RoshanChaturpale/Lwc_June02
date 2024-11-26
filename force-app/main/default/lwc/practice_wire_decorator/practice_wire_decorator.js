import { LightningElement, wire } from 'lwc';
import getContactlist from '@salesforce/apex/apexClass_practice_LWC.getContactlist';

export default class Practice_wire_decorator extends LightningElement {
    @wire(getContactlist) contacts;
}