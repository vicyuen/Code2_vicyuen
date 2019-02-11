class Paddle {
  float x;
  float y;
  float w;
  float h;

  Paddle(float xpos, float ypos, float myWidth, float myHeight) {
    x = xpos;
    y = ypos;
    w = myWidth;
    h = myHeight;
  }

  void update() {
  }

  void display(float xpos) {
    x = xpos;
    rect(x, y, w, h);
  }
}
