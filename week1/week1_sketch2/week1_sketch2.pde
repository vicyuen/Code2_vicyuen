float theta = 0.0;
float x;
float y;
boolean clicked;

void setup() {
  size(500, 500);
  clicked = false;
}

void draw() {
  
  background(255);
  if (clicked == false) {
    x = (sin(theta)) * width/2 + width/2; 
    y = height/2;
  } else {
    y = (cos(theta)) * height/2 + height/2; 
    x = width/2;
  }
  
  if (mousePressed && (dist(x, y, mouseX, mouseY)< 25)) {
      clicked = true;
    }

    stroke(1);
    ellipse(x, y, 50, 50);
    theta += TWO_PI/150.0;
  }
