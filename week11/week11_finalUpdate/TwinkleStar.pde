class TwinkleStar {
  PVector pos;
  float r1;
  float r2;
  int npoint;
  PVector vel;

  TwinkleStar() {
    pos = new PVector(random(width), random(height));
    r1 = random(2, 4.5);
    r2 = random(3, 5.5);
    npoint = int(random(10, 20));
    vel = new PVector(random(-2, 5), random(-2, 5));
  }

  void update() {
    pos.add(vel);
    if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    } else if (pos.y > height) {
      pos.y = 0;
    } else if (pos.y < 0) {
      pos.y = height;
    }
  }


  void display() {
    pushMatrix();
    translate(pos.x - width/2, pos.y - height/2);
    rotate(frameCount/-100);
    noStroke();
    fill(#ffd1fb, 200);
    starShape(0, 0, r1, r2, npoint);
    popMatrix();
  }

  void starShape(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius2;
      float sy = y + sin(a) * radius2;
      vertex(sx, sy);
      sx = x + cos(a+halfAngle) * radius1;
      sy = y + sin(a+halfAngle) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
