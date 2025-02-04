import { LightningElement ,api} from 'lwc';

export default class MovieSearchChild extends LightningElement {

    @api movie;


    clickHandler(event){

        //console.log('movie id ', this.movie.imdbID);

        //create Custom Event
        this.dispatchEvent(new CustomEvent('movieclicked', {
            detail: this.movie.imdbID}));
    }
}