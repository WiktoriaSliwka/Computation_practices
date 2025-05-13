//duotone terrain generated with perlin noise 
//create a 2d landscape using perlin noise and apply a duotone effect 

float noiseScale = 0.1;  // zoom in and out
float threshold = 0.5;    // Percentage of each color
color toneA, toneB;
float xOffset =0;
float yOffset=0;

void setup() {
  size(400, 600);
  noLoop();

  toneA = color(random(255),random(255),random(255));  
  toneB = color(random(255),random(255),random(255));  
}
void draw() {
  background(255);

      float yOffset;   
        for (int y = 0; y < height; y++) { // looping it over every line in x and y
      float xOffset;
        for (int x = 0; x < width; x++) {
          
       //ask how this line works in class
      float noiseVal = noise(x * noiseScale, y * noiseScale); //* by x and y or it combines the colours
      
      if (noiseVal > threshold) {
        stroke(toneA);
      } else {
        stroke(toneB);
      }
      point(x, y);  
     
    }
    
  }
}
