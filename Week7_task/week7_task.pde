//(Optional). Can you add an audio-reactive visualisation? For this, you may want to increase the frameRate to achieve a smooth animation. For example, if you want the music to play at 120 bpm, which is 2 times per second, set the frameRate to 60 and play the base sound every 30th frame (frameCount % 30 == 0).
//(Advanced). Can you combine sound synthesised with an oscillator (task from last week) with looped samples in a single piece of music?

import processing.sound.*;

ArrayList<Particle> particles = new ArrayList<Particle>();

Reverb reverb;
SoundFile[] samples = new SoundFile[6];

boolean showImage = false;

SoundFile sample1, sample2, sample3, sample4, sample5, sample6;

float bpm = 120;
float myFrameRate = bpm / 60;
int framesPerBeat = int(myFrameRate * 60 / bpm);

// Oscillator
SinOsc osc;
boolean oscPlaying = false;

void setup() {
  size(501, 700);
  background(255);
  frameRate(myFrameRate);
 

  osc = new SinOsc(this);
  osc.freq(440);
  osc.amp(0.2);

  sample1 = new SoundFile(this, "Aud_samples/wood.wav");
  sample1.amp(0.4);
  sample1.rate(1.0);

  sample2 = new SoundFile(this, "Aud_samples/cow.wav");
  sample3 = new SoundFile(this, "Aud_samples/fat-low-clap-unpolished-hit_A#_minor.wav");
  sample4 = new SoundFile(this, "Aud_samples/kick_w_echo_1s.wav");
  sample5 = new SoundFile(this, "Aud_samples/glass.wav");
  sample6 = new SoundFile(this, "Aud_samples/snare-shot-quick-transient.wav");

  reverb = new Reverb(this);
  reverb.process(sample2);
}

void draw() {
  background(random(255), random(255), random(255));
  showImage = false;

  // Oscillator event
  if (frameCount % (framesPerBeat * 3) == 0 && random(1) > 0.5) {
    osc.freq(random(200, 800));
    osc.play();
    oscPlaying = true;
  }
  if (oscPlaying && frameCount % (framesPerBeat * 3) == 1) {
    osc.stop();
    oscPlaying = false;
  }

  // Sample playback timing
  if (frameCount % framesPerBeat == 0) sample3.play();
  if (frameCount % (framesPerBeat * 2) == 0) sample4.play();
  if (frameCount % (framesPerBeat * 4) == 0 && random(1) >= 0.5) sample2.play();
  if (frameCount % (framesPerBeat * 2) == 0 && random(1) >= 0.7) sample1.play();
  

  if (frameCount == 1 || frameCount % (framesPerBeat * 4) == 0) {
  sample5.play();
}

  if (frameCount % (framesPerBeat * 3) == 0) sample6.play();


  // Central rotating shape
  pushMatrix();
  translate(width / 2, height / 2);
  rotate(radians(frameCount % 360));
  fill(255, 0, 255, 100);
  ellipse(0, 0, 100 + sin(frameCount * 0.1) * 50, 100 + sin(frameCount * 0.1) * 50);
  popMatrix();
  
  if (frameCount % framesPerBeat == 0) {
  for (int i = 0; i < 15; i++) {  
    float radius = random(50, 150);
    float x = random(width);
    float y = random(height);

    fill(random(255), 100, 255);
    ellipse(x, y, radius, radius);
  }
}


  // Particle system
  if (frameCount % framesPerBeat == 0) {
    for (int i = 0; i < 10; i++) {
      particles.add(new Particle(width / 2, height / 2));
    }
  }

  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.display();
    if (p.isOffscreen()) {
      particles.remove(i);
    }
  }
}

// Custom class to track both position and velocity
class Particle {
  PVector pos;
  PVector vel;
  float size;
  color c;

  Particle(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D().mult(random(7, 17));
      size = random(10, 30);
       c = color(random(255), random(255), random(255), 200);
  }

  void update() {
    pos.add(vel);
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, size, size);
  }

  boolean isOffscreen() {
    return dist(pos.x, pos.y, width / 2, height / 2) > 200;
  }
}
 


  

    
 
