float OneDiam = 80;
float TwoDiam = 110;
float ThreeDiam = 140;
float FourDiam = 60;

float OneOrbitRadius =100;
float TwoOrbitRadius =150;
float ThreeOrbitRadius =250;
float FourOrbitRadius =250;


void setup(){
    size(600,600);
    blendMode(BLEND);
    rectMode(CENTER);
    blendMode(DIFFERENCE);
    frameRate(60);   
}


void draw(){
  background(0);   
  translate(width/2,height/2);   // move origin to the center of the screen
  noStroke();
  
  //centre 
  fill(204, 204, 255);
  ellipse(0, 0, 60, 60);
    
    
   for (int i = 0; i < 6; i++) {
        pushMatrix();
        float angle = TWO_PI / 6 * i + frameCount * 0.02;  // Spaced evenly, rotating
        rotate(angle);
        translate(OneOrbitRadius, 0);
        fill(153, 0, 76);
        ellipse(0, 0, OneDiam, OneDiam);
        popMatrix();
    }
    
    for (int i = 0; i < 8; i++) {
        pushMatrix();
        float angle = TWO_PI / 8 * i + frameCount * 0.02;  
        rotate(-angle);
        translate(TwoOrbitRadius, 0);
        fill(204, 102, 0);
        ellipse(0, 0, TwoDiam, TwoDiam);
        popMatrix();
    }
    
   for (int i = 0; i < 10; i++) {
        pushMatrix();
        float angle = TWO_PI / 10 * i + frameCount * 0.015;  
        rotate(angle);
        translate(ThreeOrbitRadius,0);
        fill(255,0,0);
        ellipse(0,0,ThreeDiam, ThreeDiam);
        popMatrix();
   }
   
  for (int i = 0; i < 10; i++) {
        pushMatrix();
        float angle = TWO_PI / 10 * i + frameCount * 0.01;
        rotate(-angle);
        translate(FourOrbitRadius, 0);
        fill(255, 255, 0);
        ellipse(0, 0, FourDiam, FourDiam);
        popMatrix();
  }

  
}
   
