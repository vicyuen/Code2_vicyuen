//for circle class
ArrayList<Circle> circle = new ArrayList<Circle>();

//stars for state 1 & 2
Star[] stars = new Star[600];
ArrayList<TwinkleStar> twinkleStar = new ArrayList<TwinkleStar>(); //star class
float size1 = 20;
float size2 = 20;
int state = 0;
float speed;
float theta = 0;
int addHue = 25;

import processing.sound.*;
FFT fft;
AudioIn in;
SoundFile file;
int bands = 512;
float[] spectrum = new float[bands];

int Y_AXIS = 1;
int X_AXIS = 2;

//background gradient
color c1 = #94eaff;
color c2 = #310f7a;

int cols, rows;
int scl = 20;
int w = 1700;
int h = 1600;
//flting variable to create movement in the rest of the code
float flying = 0;
//create terrain float for landscape 
float [][] terrain;

Table table;
int scene1;
int scene2;

void setup() {
  size(1000, 600);
  background(255);
  colorMode(HSB);
  table = loadTable("data.csv");
  scene1 = table.getRow(0).getInt(0); 
  scene2 = table.getRow(1).getInt(0);

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  file = new SoundFile(this, "ODESZA - Meridian.mp3");
  file.play();

  // patch the AudioIn
  fft.input(file);
  for (int i = 0; i < 10; i++) {
    circle.add(new Circle(random(10, 15), #8285bf));
  }

  // for the stars in State1
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
} 

void draw() { 
  background(255);
  //for background gradient

  fft.analyze(spectrum);

  switch(state) {
  case 0:
    State0();
    break;
  case 1:
    State1();
    break;
  case 2:
    State2();
    break;
  case 3:
    State3();
    break;
  default:
    break;
  }

  if (size2 >= 490) {
    state = 1;
    destroyCircle();
  }

  if (twinkleStar.size() < scene2 && twinkleStar.size() >= scene1) {
    state = 2;
    //destroyTwinkleStar();
  } else if (twinkleStar.size() >= scene2) {
    state = 3;
    //destroyTwinkleStar();
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

void State0() {
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  if (spectrum[7] > 0.08 && size1 <= 320) {
    color c = color(#f26e60, 120);
    circle.add(new Circle(size1, c));
    size1 += 8;
  }
  
  //println(size1);

  if (spectrum[7] > 0.09 && size1 >= 300) {
    color c = color(#60f298, 120);
    circle.add(new Circle(size2, c));
    size2 += 13;
  }
  
  println(size2);

  for (Circle c : circle) {
    c.update();
    c.display();
  }
}

void State1() {
  setGradient(0, 0, width, height, #f1f1f1, #8285bf, Y_AXIS);
  speed = 8;
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  if (spectrum[7] > 0.12) {
    twinkleStar.add(new TwinkleStar());
  }
  
  println(twinkleStar.size());

  for (TwinkleStar t : twinkleStar) {
    t.update();
    t.display();
  }
}

void State2() {
  setGradient(0, 0, width, height, #a3a8f0, #0f0014, Y_AXIS);
  speed = map(mouseX, 0, width, 0, 60);
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }

  if (spectrum[7] > 0.12) {
    twinkleStar.add(new TwinkleStar());
  }

  println(twinkleStar.size());

  for (TwinkleStar t : twinkleStar) {
    t.pos = new PVector(width*2, 0);
    t.update();
    t.display();
  }
}

void State3() {
  addHue++;
  color color1 = color(addHue%256, 255, 200);
  color color2 = color((addHue+50)%256, 255, 200);
  setGradient(0, 0, width, height, color1, color2, Y_AXIS);
  pushMatrix();
  stroke(#f1f1f1);
  strokeWeight(1);
  translate(width/2, height);
  branch(230);
  popMatrix();
  pushMatrix();
  speed = 80;
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  popMatrix();
}

void destroyCircle() {
  for (int i = 0; i < circle.size(); i++) {
    circle.remove(i);
  }
}

void destroyTwinkleStar() {
  for (int i = 0; i < twinkleStar.size(); i++) {
    twinkleStar.remove(i);
  }
}

void branch(float len) {
  line(0, 0, 0, -len);
  theta = 58;
  translate(0, -len);
  len *= random(0.3, 0.5);

  if (len > 2) {

    pushMatrix();
    rotate(radians(theta));
    branch(len);
    popMatrix();

    pushMatrix();
    rotate(radians(0));
    branch(len);
    popMatrix();

    pushMatrix();
    rotate(radians(-theta));
    branch(len);
    popMatrix();
  }
}
