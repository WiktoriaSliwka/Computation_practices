//filtering images
PImage img;

void setup(){
  size(736,920);
  background(0);
  img = loadImage("sample1.jpg"); 
  
  colorA= color(0,103,255);// blue
  colorB = color(204,0,204);
}

//duotone
color colorA, colorB;

////threshold high contrast black and white image
// void draw(){
//   image(img,0,0);
//   loadPixels();
//   for (int i=0; i < pixels.length; i++){
//     pixels[i] = threshold(pixels[i], 100);
//   }
//   updatePixels();
// }
 
// color threshold(color pixel, int threshold) {
//   if (red(pixel) > threshold){
//     return color(255);
//   } else {
//     return color(0);
//   }
// }


////Invert the colors in the drawing
// void draw(){
//   image(img,0,0);
//   loadPixels();
//   for (int i=0; i < pixels.length; i++){
//     pixels[i] = invert(pixels[i]);
//   }
//   updatePixels();
// }

//color invert(color pixel) {
//    float r = red(pixel);
//    float g = green(pixel);
//    float b = blue(pixel);
    
//    r = 255-r;
//    g = 255-g;
//    b = 255-b;
    
//    return color(r,g,b-b);

//}

//brighten the drawing 
//void draw(){
//   image(img,0,0);
//   loadPixels();
//   for (int i=0; i < pixels.length; i++){
//     pixels[i] = brighten(pixels[i], 100);
//   }
//   updatePixels();
// }


//color brighten(color pixel, float brightness){
// float r = red(pixel);
// float g = green(pixel);
// float b = blue(pixel);
// r = r + brightness;
// g = g + brightness;
// b = b + brightness;
 
// return color(r,g,b);
 
//}

//contrast 

//void draw(){
//   image(img,0,0);
//   loadPixels();
//   for (int i=0; i < pixels.length; i++){
//     pixels[i] = contrast(pixels[i], mouseX);
//   }
//   updatePixels();
// }


//color contrast(color pixel, float contrastAmount){
//    float r = red(pixel);
//    float g = green(pixel);
//    float b = blue(pixel);
    
//    float contrastFactor = (259+(contrastAmount + 255)) / (255+(259-contrastAmount));  //use 259 for contrast
    
//    r = (contrastFactor * (r-128)) + 128;
//    g = (contrastFactor * (g-128)) + 128;
//    b = (contrastFactor * (b-128)) + 128;
    
//    return color(r,g,b);
//}

//duotone

void draw(){
   image(img,0,0);
   loadPixels();
   for (int i=0; i < pixels.length; i++){
     pixels[i] = duotone(pixels[i], colorA, colorB);
   }
   updatePixels();
 }

color duotone(color pixel, color colorA, color colorB){
  float tone = red(pixel);  //our brightness value 
  float lerpAmount = norm(tone,0, 255); // only works between 0 and 1, its similar to map
  //syntat lerpColor(c1,c2, amt) // amt (float) between 0.0 and 1.0
  return lerpColor(colorA, colorB,lerpAmount);
  
  
}

   
