class Vert {

  PVector pos;
  int w = 50;
  int h;

  Vert(float x, int h_) {
    pos = new PVector(x, height/2);
    h = h_;
  }

  void display() {
    rect(pos.x, pos.y, w, h);
  }
}
