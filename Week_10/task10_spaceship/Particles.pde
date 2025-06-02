class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float decay;
  color c;
  
  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-1,1),random(-1,1));
    acceleration = new PVector();
    lifespan = 250;
    decay = 1;
  }

  void addForce(PVector f) {
    acceleration.add(f);
  }
  
  boolean expired() {
    return lifespan < 0;
  }
  
  void update() {
    lifespan -= decay;
    
    velocity.add(acceleration);
    position.add(velocity);

    acceleration.mult(0);
  }

  void display() {
    pushMatrix();
    
    translate(position.x, position.y);
    //c = color(255, 150, 50, lifespan);

   c = color(random(200,255), random(50,150), random(0,50), lifespan);
    noStroke();
    fill(c);
   

    circle(0, 0, 10);

    popMatrix();
  }
}
class Star {
  PVector pos;
  float size;
  float speed;
  float brightness;
  color c;
  
  Star() {
    reset();
  }
  
  void reset() {
    pos = new PVector(random(width), random(-height, height));
    size = random(2, 8);
    speed = random(1, 3);
   brightness = random(150, 255);
    c = color(random(180, 255), random(180, 220), 255);
  }
  
  void update() {
    pos.y += speed;
    if (pos.y > height) {
      reset();
      pos.y = 0;
    }
  }
  
  void display() {
    noStroke();
    fill(brightness, brightness, brightness, 180);
    ellipse(pos.x, pos.y, size, size);
  }
}
class Planet {
  PVector pos;
  float radius;
  float speed;
  color c;
  
  Planet() {
    reset();
  }

  void reset() {
    pos = new PVector(random(width), random(-1000, -100));
    radius = random(5, 40);
    speed = random(0.5, 1.5);
    c = color(random(100, 255), random(100, 200), random(100, 255), 100);
  }

  void update() {
    pos.y += speed;
    if (pos.y > height + radius) {
      reset();
    }
  }

  void display() {
    noStroke();
    // Glow halo
    for (int i = 5; i >= 1; i--) {
      fill(red(c), green(c), blue(c), 15 * i);
      ellipse(pos.x, pos.y, radius * i, radius * i);
    }
    fill(c);
    ellipse(pos.x, pos.y, radius, radius);
  }
}
