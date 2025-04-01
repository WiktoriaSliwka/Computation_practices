// create a for loop to avoid repetision but angles and speeds must be put in an array first
float[] angles = {0, 0, 0, 0, 0} ;     //[]means its an array 
float[] speeds = {3, 6, 9, 12,15 };

 

float xpos = 80;
float xstep = 60;

void setup() {
  size(400,400);
  rectMode(CENTER);
}

void draw(){
  background(0);
  
  for (int i=0; i<angles.length; i++) {
  pushMatrix();
    fill(152,50,204);
    translate(xpos + (xstep*i), height/2);
    rotate(radians(angles[i]));
    rect(0, 0, 50, 50);
    angles[i] = angles[i] + speeds[i];
   popMatrix();
   
    
  } 
}
