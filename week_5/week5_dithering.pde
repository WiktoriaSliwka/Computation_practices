PImage sample;

void setup(){
  size(736,773);
  sample = loadImage("sample.jpg");
  noLoop();
}

void draw(){
 image(sample,0,0);
 
 loadPixels();
 
 for(int i = 0; i < pixels.length; i++){
   float greyValue= red(pixels[i]);
   
   float newPixelValue = 0 ; //dithering effect becuase of its probability effect
   if (greyValue > 127 ){ //has to be random of 255 to be grey scale 
     newPixelValue = 255;
   }
   float error = greyValue - newPixelValue;  //calculates error by quantinising it, and adds it back into the calculation below
   
   pixels[i] = color(newPixelValue);
  atkinsonDither(i, error);  //diffuseError, fsDither, atkinsonDither
  //fsDither(i, error);
  //diffuseError(i, error);
 }
 updatePixels();

}
  

void diffuseError(int i, float error) {
    if (i < pixels.length-1) {
     float newGreyValue = red(pixels[i+1]);  //adding the error creates the dithering effect 
     //its error defusion, it defusses the neighbouring pixel. 
     pixels[i+1] = color(newGreyValue + error);
  }
}

void fsDither(int i, float error){
//x is current pixel:
//
// . x 7
// 3 5 1
// (all/16)
  int[] offsets ={
    1, width-1, width, width+1  
  };
  
  
  float[]ditherRatios ={
    7/16.0, 3/16.0, 5/16.0, 1/16.0
  };
  
  //works on surrounding pixels
  //when the pixel is proccessed, its error is split into fractions. 
  
  for (int j = 0; j< offsets.length; j++) {
    int neighbourIndex = i + offsets[j]; //everytime it goes arround the arrray it accesses a different pixel
    if(neighbourIndex < pixels.length) {
      float neighbourGrey = red(pixels[neighbourIndex]);
      pixels[neighbourIndex] = color(neighbourGrey + (error*ditherRatios[j]));
    }  
  } 
}
//atkinsons algorithm =. error is split ionto 1/8th 
//the error is spread into specific sets of nearby pixels. softer more blended effect.
//drops excess error, not all of thee error ends up distributed. This reduces the total intensity. 



//interates over all the pixels 
void atkinsonDither(int i, float error) {
  int[] offsets = {
   1,2,width-1, width, width+1, width*2
  };
  
  for(int j=0; j < offsets.length; j++) {
    int neighbourIndex = i + offsets[j];
    if(neighbourIndex < pixels.length){
      float neighbourGrey = red(pixels[neighbourIndex]);
      pixels[neighbourIndex] = color(neighbourGrey + (error/8.0));
    } //ensures that it doesnt interate off the screen
  }
}
