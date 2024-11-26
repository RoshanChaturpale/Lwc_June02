import { LightningElement, api } from 'lwc';
export default class Practice_child_com_decorator extends LightningElement {

   @api childMessege = "Hi i am from child component";

   @api handleChangeValue(){

      console.log('handleChangeValue');

      this.childMessege = "saleforce lwc demo";
   }

   
}