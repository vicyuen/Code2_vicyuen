ArrayList<Circle> circle = new ArrayList<Circle>();
float size = 20;

import processing.sound.*;

FFT fft;
AudioIn in;
SoundFile file;
int bands = 512;
float[] spectrum = new float[bands];

int Y_AXIS = 1;
int X_AXIS = 2;

color c1 = #60b5f2;
color c2 = #686dd8;

void setup() {
  size(500, 500);
  background(255);
  colorMode(HSB);

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  file = new SoundFile(this, "ODESZA - Meridian.mp3");
  file.play();
  // start the Audio Input
  //in.start();

  // patch the AudioIn
  fft.input(file);
  for (int i = 0; i < 10; i++) {
    circle.add(new Circle(random(10, 15), #8285bf));
  }
} 



void draw() { 
  background(255);

  setGradient(0, 0, width, height, c1, c2, Y_AXIS);

  fft.analyze(spectrum);

  //for (int i = 0; i < bands; i++) {
  //  // The result of the FFT is normalized
  //  // draw the line for frequency band i scaling it up by 5 to get more amplitude.
  //  //line( i, height, i, height - spectrum[i]*height*5 );
  //}

  println(spectrum[7]);
  if (spectrum[7] > 0.1) {
    color c = color(#f26e60, 120);
    circle.add(new Circle(size, c));
    size += 10;
  }

  for (Circle c : circle) {
    c.update();
    c.display();
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  } else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
