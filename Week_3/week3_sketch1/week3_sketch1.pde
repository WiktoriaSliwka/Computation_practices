float angleOne = 0;
float angleTwo = 0;

float xpos = 80; //location of square. 80 from the side 
float xstep = 60; //space between the squares 

void setup() {
    size(400,400);
    rectMode(CENTER); //draws it in the center
}

void draw(){
    background(0); //black background
    
    pushMatrix();
      fill(153, 50, 204);
      translate(xpos + (xstep*0), height/2);
      rotate(radians(angleOne));
      rect(0, 0, 50, 50); //first 2 coords are where the square is gonna be and second 2 are the size
      angleOne = angleOne +1; //adding 1 to itself do it rotates
      popMatrix();
}      
