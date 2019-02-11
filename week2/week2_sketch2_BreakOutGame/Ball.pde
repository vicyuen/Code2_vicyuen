class Ball {
  float x;
  float y;
  float r;
  float velX;
  float velY;

  Ball(float xpos, float ypos, float size, float xSpeed, float ySpeed) {
    x = xpos;
    y = ypos;
    r = size;
    velX = xSpeed;
    velY = ySpeed;
  }
  void update() {
    x += velX;
    y += velY;
  }
  void display() {
    ellipse(x, y, r, r);
  }
}
