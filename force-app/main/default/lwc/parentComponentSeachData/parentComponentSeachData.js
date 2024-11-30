import { LightningElement ,track , api} from 'lwc';

export default class ParentComponentSeachData extends LightningElement {

     fname;


    onChangeEventHandler(event){

        this.fname = event.target.value;
        console.log('this.fname' , this.fname);



        this.template.querySelector('c-child-component-show-data').handleChildRecord(this.fname);

        


    }
}