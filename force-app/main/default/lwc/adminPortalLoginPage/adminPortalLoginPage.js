import { LightningElement } from 'lwc';
import doLogin from '@salesforce/apex/CommunityAuthController.doLogin';

export default class AdminPortalLoginPage extends LightningElement {

 username;
    password;
    errorCheck;
    errorMessage;

    connectedCallback(){

        var meta = document.createElement("meta");
        meta.setAttribute("name", "viewport");
        meta.setAttribute("content", "width=device-width, initial-scale=1.0");
        document.getElementsByTagName('head')[0].appendChild(meta);
    }

    handleUserNameChange(event){

        this.username = event.target.value;
    }

    handlePasswordChange(event){
        
        this.password = event.target.value;
    }

    handleLogin(event){

       if(this.username && this.password){

        event.preventDefault();

        doLogin({ username: this.username, password: this.password })
            .then((result) => {
                
                window.location.href = result;
                console.log('result', result);
            })
            .catch((error) => {
                this.error = error;      
                this.errorCheck = true;
                this.errorMessage = error.body.message;
            });

        }

    }
}