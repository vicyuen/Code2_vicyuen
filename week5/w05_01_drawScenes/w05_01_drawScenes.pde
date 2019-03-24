// bryan ma for code 2 sp 19
String[] myHint = {"c", "l", "i", "c", "k"};
int scene = 0;
int x;
int y;
PImage img;
PImage v;

void setup() {
  size(600, 600);
  frameRate(24);
  img = loadImage("key.jpg");
  v = loadImage("vendetta.png");
}

void draw() {
  background(255);
  fill(0);
  switch (scene) {
  case 0:
    fill(100, 0, 200);
    ellipse(200, 200, 100, 100);
    for (int i = 0; i<myHint.length; i++) {
      text(myHint[i], random(50, width-50), random(50, height-50));
    }
    break;
  case 1:
    fill(0, 200, 150);
    rect(300, 300, 100, 100);
    fill(0);
    text("pressed", 325, 350);
    image(img, x, 250);
    x+=5;
    if (x>width) {
      x=0;
    }
    break;
  case 2:
    colorMode(HSB);
    fill(0, 50, 255);
    triangle(0, 0, width, 0, width/2, y);
    image(v, width/2 - 200, y - 300);
    y+=5;
    if (y>=height) {
      y=height;
    }
    break;
  case 3:
    text("adios", 100, 100);
    break;
  default:
    break;
  }
}

void keyPressed() {
  if (key=='v') {
    //if (keyCode==RETURN) {
    println("v is pressed");
    switch(scene) {
    case 2:
      advance();
      break;
    case 3:
      break;
    default:
      break;
    }
    //}
  }
  switch (scene) {
  case 1:
    advance();
    break;
  case 2:
    break;
  case 3:
    break;
  default:
    break;
  }
  //if (key==CODED) {
  //  if (keyCode==RETURN) {
  //    println("enter is pressed");
  //    switch(scene) {
  //    case 2:
  //      advance();
  //      break;
  //    case 3:
  //      break;
  //    default:
  //      break;
  //    }
  //  }
  //}
}

void mousePressed() {
  switch(scene) {
  case 0:
    advance();
    break;
  case 1:
  case 2:
  case 3:
    break;
  default:
    break;
  }
}

void advance() {
  scene++;
}
