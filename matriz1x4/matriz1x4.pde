// 2D Array of objects
Cell[][] grid;
Grid gr;
int ii=int(random(4));;

// Number of columns and rows in the grid
int rows = 1;
int cols = 4;

void setup() {
  size(1200,400);
  gr = new Grid();
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*300,0,300,400,0);
    }
  }
  
}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
 /* for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].changeColor();
      grid[i][j].display();
      delay(100);
    }
}*/
  gr.display();
  gr.animate();
  delay(200);
  ii = int(random(4));

}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float colour; // colour for animation

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempColour) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    colour = tempColour;
  } 
  
  // Animation consists of changing cells colors
  void changeColor() {
    if (colour == 125){
      colour = 0;
    }
    else{
      colour = 125;
    }
  }
  
  void paintGray() {
    colour = 125;
  }
  
  void paintBlack(){
    colour = 0;
  }
  

  

  void display() {
    stroke(255);
    fill(colour);
    //println(x,y,w,h);
    rect(x,y,w,h); 

  }
}

class Grid {
  Cell c1;
  Cell c2;
  Cell c3;
  Cell c4;

  Grid(){
    c1 = new Cell(0, 0, 300, 400, 0);
    c2 = new Cell(300, 0, 300, 400, 0);
    c3 = new Cell(600, 0, 300, 400, 0);
    c4 = new Cell(900, 0, 300, 400, 0);
  }
  void display(){
    c1.display();
    c2.display();
    c3.display();
    c4.display();
  }
  void animate(){
    switch(ii){
      case 0:
        c1.paintGray();
        c2.paintBlack();
        c3.paintBlack();
        c4.paintBlack();
        break;
       case 1:
        c2.paintGray();
        c1.paintBlack();
        c3.paintBlack();
        c4.paintBlack();
        break;
       case 2:
        c3.paintGray();
        c1.paintBlack();
        c2.paintBlack();
        c4.paintBlack();
        break;
       case 3:
        c4.paintGray();
        c1.paintBlack();
        c2.paintBlack();
        c3.paintBlack(); 
        ii = -1;
        break;
    }
  }
}
