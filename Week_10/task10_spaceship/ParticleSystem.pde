//int maxParticles = 200;
class ParticleSystem {
  PVector origin;
  ArrayList<Particle> particles;
  int count;

  ParticleSystem(float x, float y, int c) {
    origin = new PVector(x, y);
    particles = new ArrayList<Particle>();
    
    count = c;
    
    for (int i = 0; i < count; i++) {
    particles.add(new Particle(origin.x, origin.y));
  }
  }
  
  void addForce(PVector f) {
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).addForce(f);
    }
  }

  void update() {
   //if (frameCount % 2 == 0){
    particles.add(new Particle(origin.x, origin.y));
//  }

    // remove 'dead' particles
    for (int i = particles.size()-1; i >= 0; i--) {
      if (particles.get(i).expired()) {
        particles.remove(i);
      }
    }

    // for every particle:
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      p.update();
    }
  }

  void display() {
    // drawing the system
    for (int i = 0; i < particles.size(); i++) {
        Particle p = particles.get(i);
      p.display();
    }
  }
}
