//Histogram is  an array 
//array is 255 but add the zero is 256 (idk its just how the array works)
PImage sample;

void setup(){
  size(736,920);
  sample = loadImage("sample1.jpg");  // this par loads the image and sets screen size
}


void draw(){
  background(0);
  image(sample,0,0);
  sample.loadPixels();
  loadPixels();  //makes cancas pixels accessible so that they can be manipulates 
  int[] histogramRed= new int[256]; 
  int[] histogramGreen = new int[256]; 
  int[] histogramBlue = new int[256]; // creates an array oof 256 slotsfor each possible brightness value(0-255)
  
  for (int i = 0; i < sample.pixels.length; i++ ) {   //for loop
    int r= int(red(sample.pixels[i]));
    int g = int(green(sample.pixels[i]));
    int b = int(blue(sample.pixels[i]));
    
   histogramRed[r]++;
   histogramGreen[g]++;
   histogramBlue[b]++;
    
   }
   
   updatePixels();  // tells processing to apply the pixel changes to the pixel[] array
   
   
   //draws histograms 
   for (int i =0; i < 256; i++) {
     stroke(255,0,0);  //make red line
     float redHeight = map(histogramRed[i], 0, max(histogramRed), height, height-(height/3)); //map scales the histogram
     line(i, redHeight, i, height);  ///draws it vertically
   }
     
    for (int j =0; j < 256; j++) {
     stroke(0,255,0);  //make green line
     float greenHeight = map(histogramGreen[j], 0, max(histogramGreen), height, height-(height/3)); //map scales the histogram
     line(j *2, greenHeight, j, height);  ///draws it vertically
    }
     
    for (int k =0; k < 256; k++) {
     stroke(0,0,255);  //make blue line
     float blueHeight = map(histogramBlue[k], 0, max(histogramBlue), height, height-(height/3)); //map scales the histogram
     line(k*2, blueHeight, k, height);  ///draws it vertically
    }
    loadPixels();
}
 
  //image(sample,0,0); // reverts back
//}

//week 2 task add green and blue channel 
// revert back to original color 
// hint height/3
