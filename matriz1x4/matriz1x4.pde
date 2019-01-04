// 2D Array of objects
Cell[][] grid;
Grid gr;

// Number of columns and rows in the grid
int rows = 1;
int cols = 4;

// colours
int black = 0;
int white = 255;
int lightGray = 125;

void setup() {
  size(1200,400);
  gr = new Grid();
 
  
}

void draw() {
  background(black, 100);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  gr.animate();
 // gr.display();
  
  delay(220);
 

}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float colour; // colour for animation
  String string;
  
  int textSizeON = 200;
  int textSizeOFF = 100;
  

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempColour, String s) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    string = s;
    colour = tempColour;
  } 
  
  void changeColour(int tempColour){
    colour = tempColour;
  }
  
 void printText(int textColour, int textSize){
    textSize(textSize);
    fill(textColour);
    textAlign(CENTER);
    text(string, x+100, (h+textSize)/2); 
  }
 
  void display() {
    stroke(white, 200);
    fill(colour);
    rect(x,y,w,h);
  }
  
  void cellON(){
    this.changeColour(lightGray);
    this.display();
    this.printText(white, textSizeON);  
  }
  
  void cellOFF(){
    this.changeColour(black);
    this.display();
    this.printText(lightGray, textSizeOFF);
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
     

  }
  void display(){
    c1.display();
    c2.display();
    c3.display();
    c4.display();
    
   /* c1.printText(white, 200);
    c2.printText(white, 200);
    c3.printText(white, 200);
    c4.printText(white, 200);*/
  }
  

  // Animation consists of changing cells colors
  void animate(){
    ii=int(random(4));
    switch(ii){
      case 0:
        c1.cellON();
        c2.cellOFF();
        c3.cellOFF();
        c4.cellOFF();       
        break;
        
       case 1:
        c2.cellON();
        c1.cellOFF();
        c3.cellOFF();
        c4.cellOFF();     
        break;
        
       case 2:
        c3.cellON();
        c1.cellOFF();
        c2.cellOFF();
        c4.cellOFF();     
        break;
        
       case 3:
        c4.cellON();
        c1.cellOFF();
        c2.cellOFF();
        c3.cellOFF();   
        
        break;
    }
  }
}
