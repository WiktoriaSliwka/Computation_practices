//will be iterating through each frame of the movie
import processing.video.*;

Movie movie;

void setup(){
  size(880,720);
  
  movie = new Movie(this, "hueflip.mp4");
  movie.play();
  movie.volume(0);
}

void draw(){
  if(movie.available()){  
    movie.read();
    
  }
  
  image(movie, 0,0);  // shows each frame of the movie 
  
  
}
