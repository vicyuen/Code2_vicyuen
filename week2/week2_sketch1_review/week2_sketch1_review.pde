final int COLS = 25;
final int ROWS = 25;

Block[][] blocks = new Block[COLS][ROWS];

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      blocks[i][j] = new Block(i, j);
    }
  }
}

void draw() {
  // loop through all the blocks, update them, draw them
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      blocks[i][j].display();
    }
  }
}

class Block {
  int cellSize = width/COLS;
  PVector position;
  boolean isActive = false;
  color c = color(random(255), random(255), random(255));

  Block(int x, int y) {
    position = new PVector(x * cellSize, y * cellSize);
  }

  void display() {
    if (isActive) {
      fill(c);
      rect(position.x, position.y, cellSize, cellSize);
    } else {
      if (mouseX > position.x && mouseX < position.x + cellSize &&
        mouseY > position.y && mouseY < position.y + cellSize) {
        isActive = true;
      }
    }
  }
}
