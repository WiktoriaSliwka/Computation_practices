//Make a game using all of the below 1 class, 2 forces influencing the object movement,
//1 type of interaction.
//The game is knocking over a milkshakes tower by aiming a ball
//elapsed means total time game was running
//add wall limits so it doesnt fall off screen
//Balls float lower 
//Wind: Vary horizontal velocity subtly
//vel.x += random(-0.05, 0.05);
ArrayList<Target> targets;
ArrayList<Ball> balls;

int Add_Target = 0;
int maxTargets = 10;
int gameDuration = 60000;  // 3 minutes = 180000 ms
int score = 0;
int startTime;
int lastShotTime = -1000;
float safeMargin = 150;
PVector shootOrigin;
PVector dragStart;

boolean isDragging = false;

void setup() {
  size(800, 800);
  shootOrigin = new PVector(width / 2, height - 100);
  targets = new ArrayList<Target>();
  balls = new ArrayList<Ball>();
  startTime = millis();
  for (int i = 0; i < 30; i++) {
    targets.add(new Target());
  }
}

void draw() {
  background(255);
  int elapsed = millis() - startTime;
  int remaining = max(0, (gameDuration - elapsed) / 1000);

  // Draw dashed aim line
  if (isDragging) {
    stroke(0);
    strokeWeight(5);
    for (float i = 0; i < 1; i += 0.05) {
      float x = lerp(shootOrigin.x, mouseX, i);
      float y = lerp(shootOrigin.y, mouseY, i);
      if ((int)(i * 100) % 2 == 0) {
        point(x, y);
      }
    }
  }

  // Update and display targets
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

    // Check collisions
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

  // Add new target every 5s
  if (elapsed >= 5000 && elapsed - Add_Target >= 5000 && targets.size() < maxTargets) {
    targets.add(new Target());
    Add_Target = elapsed;
  }

  // UI
  fill(0);
  textSize(25);
  strokeWeight(5);
  text("Score: " + score, 10, 20);
  text("Time Left: " + remaining + "s", 10, 40);

  // Game Over check
  if (elapsed >= gameDuration) {
    pushMatrix();  // Save current transformation state
  resetMatrix(); // Reset all transformations
    fill(255);
    noStroke();
    rectMode(CORNER);
    rect(0  , 0 , width   , height); // white out screen
    
    fill(0);
    textSize(32);
    textAlign(CENTER, CENTER);
    text("Game Over!", width / 2, height / 2 - 20);
    text("Score: " + score, width / 2, height / 2 + 20);

    textSize(24);
    if (score <= 5) {
      text("Amateur\nTry Again!", width / 2, height / 2 + 60);
    } else if (score >= 6 && score < 10) {
      text("Amazing\nTry Again!", width / 2, height / 2 + 60);
    } else if (score > 10) {
      text("You are the Master!", width / 2, height / 2 + 60);
    } else {
      text("Error: Unexpected score", width / 2, height / 2 + 60);
    }
    popMatrix(); 
    noLoop();  // Stop the game
  }
}

void mousePressed() {
  dragStart = new PVector(mouseX, mouseY);
  isDragging = true;
}

void mouseReleased() {
  if (isDragging && millis() - lastShotTime >= 2000) {
    PVector dragEnd = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(dragStart, dragEnd);
    dir.limit(25);
    balls.add(new Ball(shootOrigin.copy(), dir));
    lastShotTime = millis();
  }
  isDragging = false;
}

// ----- Ball Class -----
class Ball {
  PVector pos, vel;
  float radius = 10;

  Ball(PVector startPos, PVector velocity) {
    pos = startPos.copy();
    vel = velocity.copy();
    
  }

  void update() {
    vel.y += 0.4; ///fix
    vel.mult(0.995); // slows it down slightly every frame
    pos.add(vel);
     // Update and display balls
  //for (int i = balls.size() - 1; i >= 0; i--) {
  //  Ball b = balls.get(i);
   
  //  b.update();
    

  

    
  }
   // pos.add(vel);
  

  void display() {
    fill(50, 100, 255);
    ellipse(pos.x, pos.y, radius * 2, radius * 2);
  }

  boolean offScreen() {
    return pos.y > height || pos.x < 0 || pos.x > width;
  }
}
// ----- Target Class -----
class Target {
  PVector pos, vel;
  float r = 30;
  float angle = 0;
  float spin;
  int points;

  Target() {
    //pos = new PVector(random(width), random(height * 75)); //didnt work
    pos = new PVector(random(width), random(height - safeMargin));
    vel = new PVector(random(-1, 1), random(-1, 1));
    spin = random(-0.1, 0.1);
    points = abs(vel.mag()) > 1.2 ? 5 : 1;
  }

  void update() {
    pos.add(vel);
    angle += spin;

    if (pos.x < 0 || pos.x > width) vel.x *= -1;
    if (pos.y < 0 || pos.y > height / 2) vel.y *= -1;
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
