// 2D Array of objects
Cell[][] grid;
Grid gr;

// Number of columns and rows in the grid
int rows = 1;
int cols = 4;

// colours
int black = 0;
int white = 255;

void setup() {
  size(1200,400);
  gr = new Grid();
  /*grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*300,0,300,400,0);
    }
  }*/
  
}

void draw() {
  background(black);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  gr.display();
  gr.animate();
  delay(400);
 

}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float colour; // colour for animation
  String string;

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempColour, String s) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    string = s;
    colour = tempColour;
  } 
  
  void paintGray() {
    colour = 125;
  }
  
  void paintBlack(){
    colour = 0;
  }
  
 void printText(int textColour){
    textSize(100);
    text(string, x+100, h/2); 
    fill(textColour);
  }
 
  void display() {
    stroke(white);
    fill(colour);
    rect(x,y,w,h);

  }
}

class Grid {
  Cell c1;
  Cell c2;
  Cell c3;
  Cell c4;
  int ii;

  Grid(){
    c1 = new Cell(0, 0, 300, 400, 0, "A");
    c2 = new Cell(300, 0, 300, 400, 0, "B");
    c3 = new Cell(600, 0, 300, 400, 0, "C");
    c4 = new Cell(900, 0, 300, 400, 0, "D");
     
    c1.printText(white);
    c2.printText(white);
    c3.printText(white);
    c4.printText(white);
  }
  void display(){
    c1.display();
    c2.display();
    c3.display();
    c4.display();
  }
  

  // Animation consists of changing cells colors
  void animate(){
    ii=int(random(4));
    switch(ii){
      case 0:
        c1.paintGray();
        c2.paintBlack();
        c3.paintBlack();
        c4.paintBlack();

        c1.printText(black);
        c2.printText(white);
        c3.printText(white);
        c4.printText(white);        
        break;
       case 1:
        c2.paintGray();
        c1.paintBlack();
        c3.paintBlack();
        c4.paintBlack();
        
        c1.printText(white);
        c2.printText(black);
        c3.printText(white);
        c4.printText(white);   
        break;
       case 2:
        c3.paintGray();
        c1.paintBlack();
        c2.paintBlack();
        c4.paintBlack();
        
        c1.printText(white);
        c2.printText(white);
        c3.printText(black);
        c4.printText(white);   
        break;
       case 3:
        c4.paintGray();
        c1.paintBlack();
        c2.paintBlack();
        c3.paintBlack();
        
        c1.printText(white);
        c2.printText(white);
        c3.printText(white);
        c4.printText(black);           
        break;
    }
  }
}
