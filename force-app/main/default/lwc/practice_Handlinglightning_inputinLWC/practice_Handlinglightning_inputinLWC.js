import { LightningElement , track} from 'lwc';
export default class Practice_Handlinglightning_inputinLWC extends LightningElement {

//@track fname = "Roshan Chaturpale";
    handleChange(event){

        this.fname = event.target.value;
        console.log('fname is ==>' , this.fname);
        
        
    }

}