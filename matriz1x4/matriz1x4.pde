// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 4;
int rows = 1;

void setup() {
  size(1200,400);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*300,0,300,400,0);
     // grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].oscillate();
      delay(100);
      grid[i][j].display();
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness
  float colour;

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempColour) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    //angle = tempAngle;
    colour = tempColour;
  } 
  
  // Oscillation means increase angle
  void oscillate() {
    //angle += 0.02;
    if (colour == 125){
      colour = 0;
    }
    else{
      colour = 125;
    }
  }

  void display() {
    stroke(255);
    // Color calculated using sine wave
    fill(colour);
    rect(x,y,w,h); 
  }
}
