float xpos =5;
float xstep =5;
float ypos , factor;


void setup(){
  size(600,400);
  rectMode(CENTER);
}

void draw(){
  background(0);
  
  for(int i=0; i < width/xstep; i++){
    fill(255);
    factor = float(i)/10;
    ypos = map(noise(factor), 0, 1, 0, height);
    rect(xpos + (xstep * i), ypos, xstep, xstep);
  
  }

}
