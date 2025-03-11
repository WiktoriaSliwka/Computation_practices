//change the colour using an if/else statement can be based on any condition 

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
    
     // Set the color based on the rotation angle
    if (angles[i] % 360 < 60) {
      fill(152, 50, 204);
    } else if (angles[i] % 360< 120) {
      fill(165,35,135); 
    }else if (angles[i] % 360< 180) {
      fill(191,44,156); 
    }else if (angles[i] % 360< 240) {
      fill(205,48,168); 
    }else if (angles[i] % 360< 300) {
      fill(218,51,178); 
    } else  {
      fill(238,88,203);
    }
    
    
    rotate(radians(angles[i]));
    rect(0, 0, 50, 50);
    angles[i] = angles[i] + speeds[i];
   popMatrix();
   
    
  } 
}
