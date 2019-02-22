final int NUM_SHAPES = 20;
ArrayList <Wave> myWave = new ArrayList<Wave>();

void setup() {
  size(600, 600);
  colorMode(HSB);
  background(100, 255, 0);
  rectMode(CENTER);
  noStroke();

  for (int i = 0; i < NUM_SHAPES; i++) {
    myWave.add(new Wave(map(i, 0, NUM_SHAPES, 30, width), random(100, 500)));
  }
}

void draw() {
  background(100, 255, 0);
  for (int i = 0; i < NUM_SHAPES; i++) {
    Wave wave = myWave.get(i);
    wave.move();
    wave.hover();
    wave.display();
  }
}

class Wave {
  float pos;
  color c;
  boolean isFlipped = false;
  float w = 15;
  float h = height/2;

  float a = 0.0;
  float inc = TWO_PI/25.0;
  float shift;

  Wave(float posX, float myHeights) {
    pos = posX;
    h = myHeights;
  }

  void hover() {
    if (mouseX > pos - w/2 && mouseX < pos + w/2 && mouseY > height/2 + sin(a)*shift - h/2
      && mouseY < height/2 + sin(a)*shift + h/2) {
      isFlipped = true;
    } else {
      isFlipped = false;
    }
  }

  void move() {
    shift = map(mouseX, 0, width, 3, 50);
  }

  void display() {
    if (isFlipped == false) {
      float distance = dist(mouseX, 0, pos, 0);
      c = int(map(distance, 0, width, 0, 255));
      fill(c, 150, 200);
    } else {
      fill(50, 0, 255);
    }
    rect(pos, height/2 + sin(a)*shift, w, h);
    a = a + inc;
  }
}
