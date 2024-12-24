import { LightningElement , api} from 'lwc';
export default class FirstComponent extends LightningElement {


    messege = 'Public Property';
    @api recordId;

    Name = 'Roshan';
}