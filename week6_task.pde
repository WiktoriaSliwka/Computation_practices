//combined week 3 moving squares and oscillators 
import processing.sound.*;

// Oscillators. the four differentwaves
SqrOsc sqr;
SawOsc saw;
TriOsc tri;
SinOsc sin;

Oscillator[] oscillators; //array to hold the different oscillatros objects
String[] oscnames; //array names
int currentOsc = 0;

// Analysis
Waveform waveform;
int waveformSamples = 100; //number of samples camputred is usually 512 
float[] waveData = new float[waveformSamples]; // stores it as an array float

Sound s; //sound system laptop

// my squares
float[] angles = {0, 0, 0, 0, 0}; //how rotated it is in degrees
float[] speeds = {1, 1, 1, 1, 1}; // Will be set based on amplitude
float xpos = 80; //starting x position
float xstep = 60; //space between squares

void setup() {
  size(600, 600);
  rectMode(CENTER);

  // Sound setup
  s = new Sound(this); //initalise sound
  s.volume(0.2); //volume  

  saw = new SawOsc(this);
  sqr = new SqrOsc(this);
  tri = new TriOsc(this);
  sin = new SinOsc(this);

  oscillators = new Oscillator[] { saw, sqr, tri, sin };
  oscnames = new String[] { "Saw", "Square", "Triangle", "Sine" };

//waveform analaysis  
  waveform = new Waveform(this, waveformSamples);
  selectOsc(0);
}


void draw() {
  background(0);

  // Analyze waveform and compute amplitude
  waveform.analyze(waveData);
  //waveData is the current audio waveform
  float sum = 0;
  for (int i = 0; i < waveData.length; i++) {
    sum += abs(waveData[i]);
  }
  float avgAmp = sum / waveData.length;

  // Map the amptitude
  float speedValue = map(avgAmp, 0, 0.1, 0, 1); ///change this for rotation
  float colorValue = map(avgAmp, 0, 0.1, 50, 255);  // brightness
  float sizeValue = map(avgAmp, 0, 0.1, 20, 100);   // rectangle size
  
  for (int i = 0; i < angles.length; i++) {
    speeds[i] = speedValue * (i + 1); // each square moves slightly faster 

//drawing orgin of squares
    pushMatrix();
    translate(xpos + (xstep * i), height/2);

    fill(colorValue + i*10, 100 + i*10, 255 - i*20);

//rotates and update the angles speed
    rotate(radians(angles[i]));
    rect(0, 0, sizeValue, sizeValue);
    angles[i] = angles[i] + speeds[i];
    popMatrix();
  }

  // Optional: show current oscillator name
  fill(255);
  text(oscnames[currentOsc], width - 100, 20);
}

//stop and change to a different oscillator 
void selectOsc(int o) {
  oscillators[currentOsc].stop();
  currentOsc = o;
  waveform.input(oscillators[currentOsc]);
  oscillators[currentOsc].play();
}

void keyPressed() {
  if (key == '1') selectOsc(0);
  if (key == 'a') selectOsc(1); // 2 isnt working had to change to a
  if (key == '3') selectOsc(2);
  if (key == '4') selectOsc(3);
}
