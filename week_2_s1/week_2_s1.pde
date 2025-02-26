PImage img;

void setup(){
  size(600, 600);
  img = loadImage("sample.jpg");
  img.loadPixels();
  for(int i = 0; i < img.pixels.length; i++){
    color c = img.pixels[i];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    //swap colour channe;s RGB - BGR
    img.pixels[i] = color(b ,g, r);
 }
  
    image(img,0,0);
    
 
}
