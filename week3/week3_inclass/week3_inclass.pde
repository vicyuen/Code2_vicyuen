final int NUM_SHAPES = 20;

float[] pos = new float[NUM_SHAPES];
color[] colors = new color[NUM_SHAPES];
float[] heights = new float [NUM_SHAPES];


void setup() {
  size(600, 600);

  for (int i = 0; i < NUM_SHAPES; i++) {
    pos[i] = map(i, 0, NUM_SHAPES, 30, width);
    colors[i] = color(map(i, 0, NUM_SHAPES, 0, 255));
    heights[i] = random(100, 500);
  }
}

void draw() {
  for (int i = 0; i < NUM_SHAPES; i++) {
    rectMode(CENTER);
    colorMode(HSB);
    fill(colors[i]);
    rect(pos[i], height/2, 20, heights[i]);
  }
}
