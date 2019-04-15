class Jerry {
  PVector pos;
  PImage jerryIMG;

  Jerry() {
    jerryIMG = loadImage("jerry.png");
    pos = new PVector(random(0, width), random(0, height));
  }

  void update() {
    pos = new PVector(mouseX, mouseY);
  }

  void display() {
    imageMode(CENTER);
    jerryIMG.resize(100, 0);
    image(jerryIMG, pos.x, pos.y);
  }
}
