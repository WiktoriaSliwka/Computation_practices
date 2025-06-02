//Make a game using all of the below 1 class, 2 forces influencing the object movement,
//1 type of interaction.
//The game is knocking over a milkshakes tower by aiming a ball
//elapsed means total time game was running
//add wall limits so it doesnt fall off screen
//Balls float lower 
//
ArrayList<Target> targets;
ArrayList<Ball> balls;

int Add_Target = 0;
int maxTargets = 10;
int gameDuration = 1800000;
int score = 0;
int startTime;
int lastShotTime = -1000;

PVector shootOrigin;
PVector dragStart;

boolean isDragging = false;

void setup(){
  size(800,800);
  shootOrigin = new PVector(width/2, height - 50); //where the gamer shoots MODIFY LATER
  targets = new ArrayList<Target>();
  balls = new ArrayList<Ball>();
  startTime = millis();
  for (int i = 0; i < 5; i++) { //add more objects gradually 
    targets.add(new Target());
  }
}


void draw(){
  background(255);
  int elapsed = millis() - startTime;  // Timer
  int remaining = max(0, (gameDuration - elapsed) / 1000);
  
  // Draw aim line while dragging
  if (isDragging) {
    stroke(0);
    for (float i = 0; i < 1; i += 0.05) {
      float x = lerp(shootOrigin.x, mouseX, i);
      float y = lerp(shootOrigin.y, mouseY, i);
      if ((int)(i * 100) % 2 == 0) {
        point(x, y);
      }
    }
  }
  
  for (int i = targets.size() - 1; i >= 0; i--) {
    Target t = targets.get(i);
    t.update();
    t.display();
  }

  // Update and display balls
  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball b = balls.get(i);
    b.update();
    b.display();

    // Check collision with targets
    for (int j = targets.size() - 1; j >= 0; j--) {
      if (targets.get(j).checkHit(b)) {
        score += targets.get(j).points;
        targets.remove(j);
        break;
      }
    }
  

    if (b.offScreen()) {
      balls.remove(i);
    }
  }
      if (elapsed >= 10000 && elapsed - Add_Target  >= 10000 && targets.size() < maxTargets) {
  targets.add(new Target());
  Add_Target = elapsed;
   
    // UI
  fill(255);
  textSize(16);
  text("Score: " + score, 10, 20);
  text("Time Left: " + remaining + "s", 10, 40);
  
  if (elapsed >= gameDuration) {
    fill(255);
    rect(0, 0, width, height); // clear screen
    fill(0);
    textSize(32);
    textAlign(CENTER);
    text("Game Over!", width/2, height/2);
    text("Score: " + score, width/2, height/2 + 40);

//  line(shootOrigin.x, shootOrigin.y, mouseX, mouseY);
}
    if (score <= 5){
      text("Amature\nTry Again!", width/2, height/2 + 60); //\n has to be in the same ""
    } else if (score >= 6 &&  score < 10) {
      text("Amazing\nTry Again!", width/2, height/2 + 60);
    } else if (score  > 10) {
      text("You are the Master!", width/2, height/2 + 60);
    }else {
  text("Error: Unexpected score", width/2, height/2 + 60);
        }
   noLoop();
  // return;
   
  
  }
 
}


 // }
    
      
void mousePressed() {
   dragStart = new PVector(mouseX, mouseY);
   isDragging = true;
  }
  
//subtracting dragEnd - dragStartmakes the ball shoot like  slingshot 
void mouseReleased() {
  if (isDragging && millis() - lastShotTime >= 2000) {
    PVector dragEnd = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(dragStart, dragEnd); // Pull back direction
    dir.limit(25); // Prevent too fast shots
    balls.add(new Ball(shootOrigin.copy(), dir));
    lastShotTime = millis();
  }
  isDragging = false;
}


class Ball {
  PVector pos, vel;
  float radius = 10;

  Ball(PVector startPos, PVector velocity) {
    pos = startPos.copy();
    vel = velocity.copy();
  }

  void update() {
    vel.y += 0.1; // gravity
    pos.add(vel);
  }

  void display() {
    fill(50, 100, 255);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  boolean offScreen() {
    return pos.y > height || pos.x < 0 || pos.x > width;
  }
}


class Target {
  PVector pos, vel;
  float r = 30;
  float angle = 0;
  float spin;
  int points;

  Target() {
    pos = new PVector(random(width), random(height/2));
    vel = new PVector(random(-1, 1), random(-1, 1));
    spin = random(-0.1, 0.1);
    points = abs(vel.mag()) > 1.2 ? 5 : 1;
  }

  void update() {
    pos.add(vel);
    angle += spin;

    if (pos.x < 0 || pos.x > width) vel.x *= -1;
    if (pos.y < 0 || pos.y > height/2) vel.y *= -1;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    fill(255, 0, 100);
    rectMode(CENTER);
    rect(0, 0, r, r);
    popMatrix();
  }

  boolean checkHit(Ball b) {
    return dist(pos.x, pos.y, b.pos.x, b.pos.y) < r / 2 + b.radius;
  }
}
