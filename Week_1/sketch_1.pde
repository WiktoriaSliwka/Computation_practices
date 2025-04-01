void setup() {
  size(600,600);
  //background(255,0,0); // 255 solid R/g/b
  
  loadPixels(); //load the pixel array
  for(int i=0; i < pixels.length; i++) { //3 parts of a for loop
    pixels[i] = color(0,255,0); //255 for solid r/G/b
    //(random(0,255), random(0,255), random(0,255))
 }
 set(200,200,color(255,0,0));
 //color c = get(0,0);
 updatePixels();
}
