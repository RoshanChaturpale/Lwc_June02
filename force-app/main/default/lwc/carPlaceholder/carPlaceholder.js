import { LightningElement , api} from 'lwc';
import PLACEHOLDER_URL from '@salesforce/resourceUrl/CarPlaceholder';

export default class CarPlaceholder extends LightningElement {


    @api  message='';

    carPlaceHolder_URL = PLACEHOLDER_URL;
}