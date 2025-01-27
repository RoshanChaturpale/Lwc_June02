import { LightningElement ,api} from 'lwc';

export default class CarTileChildComponent extends LightningElement {

    @api car={};


    cardOnClickHandler(){

        this.dispatchEvent(new CustomEvent('cardclicked',{
            detail: this.car.Id}))
    }
}