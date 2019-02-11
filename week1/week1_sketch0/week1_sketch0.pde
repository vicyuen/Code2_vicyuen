String[]food = {"burger", "sushi", "ramen", "rice"};
int[] x = new int[4];
int y;
void setup() {
  background(0);
  size(500, 500);
  y = height/2;
  x[0] = width/4 - width/8;
  x[1] =width/4*2 - width/8;
  x[2] = width/4*3 - width/8;
  x[3] = width - width/8;
}

void draw() {

  ellipse(x[0], y, 50, 50);
  ellipse(x[1], y, 50, 50);
  ellipse(x[2], y, 50, 50);
  ellipse(x[3], y, 50, 50);
}

void mousePressed() {
  background(0);
  if (dist(x[0], y, mouseX, mouseY)< 25) {
    text(food[0], width/2, height - 100);
  }
  if (dist(x[1], y, mouseX, mouseY)< 25) {
    text(food[1], width/2, height - 100);
  }
    if (dist(x[2], y, mouseX, mouseY)< 25) {
    text(food[2], width/2, height - 100);
  }
    if (dist(x[3], y, mouseX, mouseY)< 25) {
    text(food[3], width/2, height - 100);
  }
}
