//use a custom class instead of multiple 2D arrays
//class would define object that has a position, color, and boolean to determine if it is active

final int COLS = 25;
final int ROWS = 25;

float cellSize;
ArrayList <Cell> myCells = new ArrayList<Cell>();


void setup() {
  size(600, 600);
  background(255);
  noStroke();

  cellSize = width/COLS;

  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      myCells.add(new Cell(i * cellSize, j * cellSize, cellSize, cellSize, 
        color(random(255), random(255), random(255)), false));
    }
  }
}

void draw() {

  for (int i = 0; i < myCells.size(); i++) {
    Cell thisCell = myCells.get(i);

    if (thisCell.active) {
      thisCell.display();
    } else {
      if (mouseX > thisCell.x && mouseX < thisCell.x + thisCell.w && 
        mouseY > thisCell.y && mouseY < thisCell.y + thisCell.h) {
        thisCell.active = true;
      }
    }
  }
}

class Cell {
  float x;
  float y;
  float w;
  float h;
  color c;
  boolean active;
  Cell(float xPos, float yPos, float myWidth, float myHeight, color myColor, boolean isActive) {
    x = xPos;
    y = yPos;
    w = myWidth;
    h = myHeight;
    c = myColor;
    active = isActive;
  }

  void update() {
  }

  void display() {
    fill(c);
    rect(x, y, w, h);
  }
}
