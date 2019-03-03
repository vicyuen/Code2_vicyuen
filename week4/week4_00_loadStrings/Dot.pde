class Dot {
  int size;
  float saturation;
  PVector position;

  Dot (PVector position_, float saturation_, int size_) {
    position = position_;
    saturation = saturation_;
    size = size_;
  }
  void display () {
    pushMatrix();
    noStroke();
    fill (150, saturation, 200);
    ellipse (position.x, position.y, size, size);
    popMatrix();
  }
}
