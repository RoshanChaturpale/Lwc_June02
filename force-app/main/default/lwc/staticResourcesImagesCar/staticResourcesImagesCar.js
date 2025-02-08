import { LightningElement } from 'lwc';
import CARHUB_IMAGES from '@salesforce/resourceUrl/carhub_images';


export default class StaticResourcesImagesCar extends LightningElement {

    carHubImages = [
        `${CARHUB_IMAGES}/ford_ecosport.png`,
        `${CARHUB_IMAGES}/ford_endeavour.png`,
        `${CARHUB_IMAGES}/ford_figo.png`
    ]; // Replace with actual file names in your ZIP

    connectedCallback() {
        console.log('Car images:', this.carHubImages);
    }
}