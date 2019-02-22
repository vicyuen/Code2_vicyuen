final int NUM_SHAPES = 20;

float[] pos = new float[NUM_SHAPES];
color[] colors = new color[NUM_SHAPES];
float[] heights = new float [NUM_SHAPES];
boolean[] isFlipped = new boolean [NUM_SHAPES];

float a = 0.0;
float inc = TWO_PI/25.0;

void setup() {
  size(600, 600);
  colorMode(HSB);
  background(100, 255, 0);
  rectMode(CENTER);

  noStroke();
  for (int i = 0; i < NUM_SHAPES; i++) {
    pos[i] = map(i, 0, NUM_SHAPES, 30, width);
    colors[i] = color(map(i, 0, NUM_SHAPES, 0, 255), 255, 200);
    heights[i] = random(100, 500);
    isFlipped[i] = false;
  }
}

void draw() {
  background(100, 255, 0);
  for (int i = 0; i < NUM_SHAPES; i++) {
    float shift = map(mouseX, 0, width, 3, 50);
    if (mouseX > pos[i] - 15/2 && mouseX < pos[i] + 15/2 && mouseY > height/2 + sin(a)*shift - heights[i]/2
      && mouseY < height/2 + sin(a)*shift + heights[i]/2) {
      isFlipped[i] = true;
    } else {
      isFlipped[i] = false;
    }

    if (isFlipped[i] == false) {
      float distance = dist(mouseX, 0, pos[i], 0);
      colors[i] = int(map(distance, 0, width, 0, 255));
      fill(colors[i], 150, 200);
    } else {
      fill(50, 0, 255);
    }
    rect(pos[i], height/2 + sin(a)*shift, 15, heights[i]);
  }
  a = a + inc;
}
