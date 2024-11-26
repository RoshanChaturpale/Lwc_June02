public class WrapperController {
    
    Public FavHeroWrapper objFavHero{get;set;}     //Initialize
    Public List<FavHeroWrapper> listWrap{get;set;}
    
    
    
    public WrapperController(){                   //Constructor
        
        listWrap = new List<FavHeroWrapper>();   // Create Object
        
        
        FavHeroWrapper objFavHero = new FavHeroWrapper();      // Create Object
        
        objFavHero.Name = 'Roshan';
        objFavHero.Age = 30;
        objFavHero.isMarried = True;
        objFavHero.decHeight = 5.7;
        listWrap.add(objFavHero);
        
        
        FavHeroWrapper objFavHero1 = new FavHeroWrapper();    // Create Object
        
        objFavHero1.Name = 'Rajesh';
        objFavHero1.Age = 25;
        objFavHero1.isMarried = false;
        objFavHero1.decHeight = 6.0;
        listWrap.add(objFavHero1);
        
       
       
    }
    
    
    Public class FavHeroWrapper{            //Wrapper class
        
        public string Name{get;set;}
        public integer Age{get;set;}
        public boolean isMarried{get;set;}
        public Decimal decHeight{get;set;}
        
        
        
    }

}