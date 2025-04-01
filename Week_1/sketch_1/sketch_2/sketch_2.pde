////gradient
void setup(){
  size(600,600); //page size 
}

void draw(){
  loadPixels(); //need to load pixels to use them
  for(int x=0; x<width; x++) {// remeber ; for syntax
    for(int y=0; y<height; y++){
      float normalizedX = map(x,0,width,0,1); //map changes variables throught the loop here it goes up ++
      int red = int(225 * normalizedX);
      int green = 0;
      int blue = int(255*(1-normalizedX));
      
      color c = color(red,green,blue);
      pixels[ x + y * width] = c;
      
    }
  }
  updatePixels();
}
