import { LightningElement, wire } from 'lwc';

import {
    subscribe,
    unsubscribe,
    APPLICATION_SCOPE,
    MessageContext,
} from 'lightning/messageService';
import MOVIERECORDSELECTED from '@salesforce/messageChannel/movieSearchMessageChannel__c';

export default class MovieDetails extends LightningElement {


    subscription = null;
    recordId;
    searchResult=[];
    movieDetails=[];

    @wire(MessageContext)
    messageContext;

    // Encapsulate logic for Lightning message service subscribe and unsubsubscribe
    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                MOVIERECORDSELECTED,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    unsubscribeToMessageChannel() {
        unsubscribe(this.subscription);
        this.subscription = null;
    }

    // Handler for message received by component
    handleMessage(message) {
        let movieId = message.movieRecordId;
        //console.log('this.recordId is  ==> ' , this.recordId);
        this.searchMovie(movieId);
    }

    // Standard lifecycle hooks used to subscribe and unsubsubscribe to the message channel
    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    disconnectedCallback() {
        this.unsubscribeToMessageChannel();
    }


    //call Movie Api

    //http://www.omdbapi.com/?i=4747&plot=fulls


    // Fetch movie data
    async searchMovie(movieId) {
       
        const url = `https://www.omdbapi.com/?i=${movieId}&plot=full&apikey=caa79578`;

       
            const res = await fetch(url);
            const data = await res.json();
            //console.log('Movie Search Result:', data);
            this.movieDetails = data;
       
           
    }





}