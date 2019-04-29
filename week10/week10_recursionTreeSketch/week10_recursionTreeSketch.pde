float theta = 0;

void setup() {
  size(700, 800);
  noLoop();
}

void draw() {
  background(255);
  //theta = map(mouseX, 0, width, 0, PI/2);
  strokeWeight(1);
  translate(width/2, height);
  branch(250);
}

void branch(float len) {
  line(0, 0, 0, -len);
  theta = 5;
  translate(0, -len);
  len *= random(0.3, 0.8);

  if (len > 2) {

    pushMatrix();
    rotate(radians(theta*2));
    branch(len);
    popMatrix();

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
    
    pushMatrix();
    rotate(radians(-theta*2));
    branch(len);
    popMatrix();
  }
}
