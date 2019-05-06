float xoff = 0.0;

void setup(){
  size(500,500);
}

  


void draw() {
  background(255);
  xoff = xoff + .01;
  float n = noise(xoff) * width;
  line(n, 0, n, height);
  bezier(85, 20, 30*noise(xoff), 30*noise(xoff), 90, 90, 15, 80);
}
