class BrickC1 extends Brick {
  float angle = 0.0;
  float speed = 0.01;
  
  BrickC1(float x, float y, float w, float h) {
    super(x, y, w, h);
    active = true;
  }
  void display() {
    rectMode(CORNER);
    stroke(200);
    fill(100, 0, 255);
    //rect(x, y, w, h);
    
    pushMatrix();
    translate(x+w/2, y+h/2);
    angle += speed;
    rotate(angle);
    translate(-(x+w/2), -(y+h/2));
    rect(x, y, w, h);
    popMatrix();
  }
}
