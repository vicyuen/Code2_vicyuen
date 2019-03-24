// bryan ma for code 2 sp 19 A

//create a state machine for a slideshow
//handle transitions between states
//draw different stuff for each state
//move what is being drawn to external data

int rows = 12;
int cols = 12;
int cellsize = 600/rows;
int MAX_LEVELS = 5;
int whichLevel = 0;

int timer = 0;

Table table;

Block[][] blocks = new Block[rows][cols];

int[][][] levels = new int[rows][cols][MAX_LEVELS];

void setup() {
  size(600, 600);

  table = loadTable("levelstatesdata.csv");

  for (int level = 0; level < MAX_LEVELS; level++) {
    for (int i = 0; i < rows; i++) {
      TableRow row = table.getRow(i + cols * level);
      for (int j = 0; j < cols; j++) {
        levels[i][j][level] = row.getInt(j);
      }
    }
  }
  loadLevel();
}

void keyPressed() {
  switch (whichLevel) {
    case 0:     
      break;
    case 1:
    case 2: 
    case 3: 
      changeState();
      break;
    case 4:
      break;
  }
  

}

void loadLevel() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (levels[j][i][whichLevel] == 0) {
        blocks[j][i] = new DarkBlock(i, j);
      } else {
        blocks[j][i] = new LightBlock(i, j);
      }
    }
  }
}

void draw() {
  //background(255);

  boolean shouldChangeLevel = true;

  switch (whichLevel) {
    case 0:
      timer++;
      if (timer > 120) {
        changeState();
      }
      background(255);
      fill(0);
      textSize(64);
      text("the game title", 100, 100);
      break;
    case 1:
    case 2:
    case 3:
      for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
          blocks[j][i].display();
          blocks[j][i].update();
          if (blocks[j][i].c > 0) {
            shouldChangeLevel = false;
          }
        }
      }
      if (shouldChangeLevel) {
        changeState();
      }
      break;
    case 4:
      background(255);
      fill(0);
      textSize(64);
      text("you win!", 100, 100);
    }
}

void changeState() {
  whichLevel++;
  loadLevel();
}

class Block {
  PVector pos;
  float c;

  Block(int row, int col) {
    pos = new PVector(row * cellsize, col * cellsize);
  }

  void display() {
    fill(c);
    rect(pos.x, pos.y, cellsize, cellsize);
  }

  void update() {
    if (mouseX > pos.x && mouseX < pos.x + cellsize &&
      mouseY > pos.y && mouseY < pos.y + cellsize) {
      c = 0;
    }
  }
}

class LightBlock extends Block {
  LightBlock(int row, int col) {
    super(row, col);
    c = 220;
  }
}

class DarkBlock extends Block {
  DarkBlock(int row, int col) {
    super(row, col);
    c = 50;
  }
}
