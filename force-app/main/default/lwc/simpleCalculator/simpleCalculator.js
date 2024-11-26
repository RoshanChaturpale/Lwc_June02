import { LightningElement, track } from 'lwc';

export default class SimpleCalculator extends LightningElement {

    @track input1;
    @track input2;
    @track Result;

    onChangedhandllerWithFirstValue(event){

        console.log('i im in this onChangedhandllerWithFirstValue')

        this.input1 = event.target.value;
        console.log(this.input1);
        }

    onChangedhandllerWithSecondValue(event){

        console.log('i im in this onChangedhandllerWithSecondValue')
        this.input2 = event.target.value;
        console.log(this.input2);
        }

    onClickAddition(event){

            console.log('im in onClickAddition event');

            this.Result = parseInt(this.input1) + parseInt(this.input2);
            console.log(this.Result);
        }
    
    onClickSubtraction(event){

            console.log('im in onClickSubtraction event');

            this.Result = parseInt(this.input1) - parseInt(this.input2);
            console.log(this.Result);
        }

    onClickMultiplication(event){

            console.log('im in onClickMultiplication event');

            this.Result = parseInt(this.input1) * parseInt(this.input2);
            console.log(this.Result);
        }

    onClickdivision(event){

            console.log('im in onClickdivision event');

            this.Result = parseInt(this.input1) / parseInt(this.input2);
            console.log(this.Result);
        }
}