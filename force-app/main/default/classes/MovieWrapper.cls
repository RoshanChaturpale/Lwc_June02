public class MovieWrapper {
    public Boolean success;
    public List<result> result;

    // Make the inner class public
    public class result {
        public String Title;
        public String Year;
        public String imdbID;
        public String Type;
        public String Poster;
    }
}