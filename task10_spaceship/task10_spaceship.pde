PVector gravity, wind;

ArrayList<ParticleSystem> systems;
ArrayList<Star> stars;
ArrayList<Planet> planets;

PVector jellyPos;

void setup() {
  size(800, 800);
  background(0);
  stars = new ArrayList<Star>();
planets = new ArrayList<Planet>();

for (int i = 0; i < 200; i++) {
  stars.add(new Star());
}

for (int i = 0; i < 5; i++) {
  planets.add(new Planet());
}

  jellyPos = new PVector(width/2 , height/2 - 10);
  gravity = new PVector(0, 0.05);
  wind = new PVector(0.2, 0);
  systems = new ArrayList<ParticleSystem>();
 
}

void draw() { 
  background(0);
  for (Star s : stars) {
  s.update();
  s.display();
}

for (Planet p : planets) {
  p.update();
  p.display();
}

  for (ParticleSystem ps : systems) {
    ps.addForce(gravity);
    
    //returns number of seconds since starting sketch 
    float t = millis() * 0.0005; //scales time
    PVector turbulence = new PVector(map(noise(t), 0, 1, -0.2, 0.2), 0);  // left-right drift maps the noise
    // noise(t) produces natural flowing motion.
    ps.addForce(turbulence);
    
    ps.update();
    ps.display();
  }
   drawJellyfish(jellyPos.x, jellyPos.y, 300, 300);
}

void drawJellyfish(float jellyX, float jellyY, float w, float h) {

  // BODY - Half ellipse (top part of jellyfish)
  fill(52, 168, 235); 
  noStroke();
  arc(jellyX, jellyY, w, h, PI, TWO_PI, CHORD);
  fill(43, 56, 64); 
  arc(jellyX , jellyY , w *1.5, h, 0, PI, CHORD);
  stroke(150, 0, 200);
  }

void mousePressed() {
  //if (frameCount % 2 == 0) {
    
  systems.add(new ParticleSystem(jellyPos.x, jellyPos.y + 120, 200));
  systems.add(new ParticleSystem(jellyPos.x + 150, jellyPos.y +90, 200));
  systems.add(new ParticleSystem(jellyPos.x - 150, jellyPos.y + 90, 200));
}

//}

void keyPressed() {
  if (key == 'r') {
    setup();
  }
  if (key == 'w') {
    wind = new PVector(random(0.1, 0.3), random(-0.1, 0.1));
    for (ParticleSystem ps : systems) {
      ps.addForce(wind);
    }
  }
}
