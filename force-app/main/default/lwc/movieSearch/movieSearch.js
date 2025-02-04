import { LightningElement, wire } from 'lwc';

import { publish , MessageContext } from 'lightning/messageService';
import MOVIERECORDSELECTED from '@salesforce/messageChannel/movieSearchMessageChannel__c';

const DELAY = 300;

export default class MovieSearch extends LightningElement {

    selectedType = '';
    loading = false;
    selectedSearch = '';
    selectedPageNumber = '1';
    delayTimeOut;
    searchResult = [];
    selectedMovie = '';

    get options() {
        return [
            { label: 'None', value: '' },
            { label: 'Movie', value: 'movie' },
            { label: 'Series', value: 'series' },
            { label: 'Episode', value: 'episode' },
        ];
    }

    handleChange(event) {
        // Destructuring event target
        let { name, value } = event.target;
        this.loading = true;

        if (name === 'type') {
            this.selectedType = value;
           // console.log('Selected Type:', this.selectedType);]
           console.log(name);
        } else if (name === 'search') {
            this.selectedSearch = value;
           // console.log('Selected Search:', this.selectedSearch);
        } else if (name === 'pageno') {
            this.selectedPageNumber = value;
           // console.log('Selected Page Number:', this.selectedPageNumber);
        }

        // Debouncing
        clearTimeout(this.delayTimeOut);

        this.delayTimeOut = setTimeout(() => {
            this.searchMovie();
        }, DELAY);
    }

    // Fetch movie data
    async searchMovie() {
       
        const url = `https://www.omdbapi.com/?s=${encodeURIComponent(this.selectedSearch)}&type=${this.selectedType}&page=${this.selectedPageNumber}&apikey=caa79578`;

       
            const res = await fetch(url);
            const data = await res.json();
            //console.log('Movie Search Result:', data);
       
            this.loading = false;

            if(data.Response === "True"){
                this.searchResult = data.Search;
               // console.log('this.response ', this.searchResult);
                
            }
    }


    get displaySearchResult(){
        return this.searchResult .length > 0 ? true : false;
    }


    //for LMS
    @wire(MessageContext)
    messageContext;


    movieChildHandler(event){

        this.selectedMovie = event.detail;

       // console.log('this.selectedMovie is ==. ', this.selectedMovie);

        const payload = { movieRecordId: this.selectedMovie };

        publish(this.messageContext, MOVIERECORDSELECTED, payload);



    }
}