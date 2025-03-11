//use radom function() create a grid of circles in chequerboard pattern. each circle will have a random or set color
//use modulo % for chequerboard pattern, random() for colors

int cols = 10;  // Number of columns
int rows = 10;  // Number of rows
int cellSize = 70;  // Size of each cell
int circleSize = 65; // Diameter of circles

float R = random(255);
float G = random (255);
float B = random (255);


void setup() {
  size(70 * 10, 70 * 10);  //found a better way yippieee
  noLoop(); // it goes crazy and a it changes the color like every second 
}

void draw() {
  background(0);
  
  for (int i = 0; i < rows; i++) {   //loop through rows and cols ++i till number is reached
    for (int j = 0; j < cols; j++) {
      
      // j/i * cellsize calculates the centre of each circle so its in the correct col/row position
      // + cellsize/2 it centres the circle inside the cell grid 
      float x = j * cellSize + cellSize / 2;   // rememeber this for future projects plzzzz
      float y = i * cellSize + cellSize / 2;
      
      if ((i + j) % 2 == 0) {  // Checkerboard pattern using modulo
         fill(random(50, 255), random(50, 255), random(50, 255));  // find way to write this once instead of in this loo[ if possible 
      } else {
        fill(random(50, 255), random(50, 255), random(50, 255));  // doesnt create any dark colors as the background is black
      }
         ellipse(x, y, circleSize, circleSize);
      //  fill(random(0, 255), random(0, 255), random(0, 255));
      //} else {
      //  fill(random(0, 255), random(0, 255), random(0, 255));
      //}
      
      
    }
  }
}
