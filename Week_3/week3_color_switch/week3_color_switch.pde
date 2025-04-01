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
    //fill(152,50,204);
    translate(xpos + (xstep*i), height/2);
    
    //adding color using a switch statement 
    switch(i){
      case 0:
        fill(238,88,203);
        break;
      case 1:
        fill(218,51,178);
        break;
      case 2:
        fill(205,48,168);
        break;
      case 3:
        fill(191,44,156);
        break;
      case 4:
        fill(165,35,135);
        break;
    }
    
    
    rotate(radians(angles[i]));
    rect(0, 0, 50, 50);
    angles[i] = angles[i] + speeds[i];
   popMatrix();
   
    
  } 
}
