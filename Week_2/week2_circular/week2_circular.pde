void setup() {
  size(600, 600);
  noLoop(); // 
}

void draw() {
  loadPixels(); // 
  
  float centerX = width / 2.0;
  float centerY = height / 2.0;
  
  float maxDist = dist(0, 0, centerX, centerY);
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      // Calculate the distance from the current pixel to the center
      float d = dist(x, y, centerX, centerY);
      
   
      float gradientValue = map(d, 0, maxDist, 0, 1);
   
      color startColor = color(170, 51, 106); // dark pink
      color endColor = color(225, 255, 225);   // white
      color interpColor = lerpColor(startColor, endColor, gradientValue);
      
      // Set the pixel color
      pixels[x + y * width] = interpColor;
    }
  }
  
  updatePixels(); // Update the pixels array
}
