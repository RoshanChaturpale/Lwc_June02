import { LightningElement } from 'lwc';
export default class Practice_parent_com_decorator extends LightningElement {


    handleClick(){

        console.log('handleClick');

        this.template.querySelector('c-practice_child_com_decorator').handleChangeValue();
    }

}