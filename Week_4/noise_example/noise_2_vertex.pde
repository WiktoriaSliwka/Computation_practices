void setup() {
  size(600,600);
//noLoop();
}

void draw() {
  loadPixels();
  
  for(int i = 0; i < pixels.length; i++) {
    int x = i % width;
    int y = i / width;
    
    pixels[i] = color(map(noise(x*0.01,y* 0.01,frameRate * 0.1), 0, 1, 255, 0));// set the value at each x/y
  }
  
  updatePixels();
}

void mousePressed() {
  redraw();
}
