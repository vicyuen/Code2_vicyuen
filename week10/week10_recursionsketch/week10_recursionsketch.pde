

void setup() {
  size(600, 600);
  noLoop();
}

void draw() {
  background(255);
  
  myFunction(100, 8);
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI/npoints;
  beginShape();
  for (float a = 0; a<TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void myFunction(float size, int point) {
  polygon(100, 100, size, point);
  translate(size*1.5, size*1.5);
  size *= random(0.3, 0.8);
  point--;

  if (size > 5) {
    //println(size);
    myFunction(size, point);
  }
}
