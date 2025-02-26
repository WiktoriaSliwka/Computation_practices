//Histogram is  an array 
//array is 255 but add the zero is 256 (idk its just how the array works)
PImage sample;

void setup(){
  size(517,606);
  sample = loadImage("sample.jpg");
}

void draw(){
  loadPixels();
  
  int[] histogram = new int[256];  
  
  for (int i = 0; i < sample.pixels.length; i++ ) {
    
    int pixelShade = int(red(sample.pixels[i]));
    pixels[i] = color(pixelShade);
    
    histogram[pixelShade]++;
   }
   updatePixels();
   
   for (int i =0; i < histogram.length; i++) {
     stroke(255,0,0);
     float starHeight = map(histogram[i], 0, max(histogram), height, height-(height/3));
     line(i, starHeight, i, height);
     
   }
  
}

//week 2 task add green and blue channel 
// revert back to original color 
// hint height/3
