void setup() {
  size(200, 200);

  //loadPixels();
  //for (int i = 0; i < pixels.length; i++) {
  //  pixels[i] = color(random(255), random(255), random(255));
  //}


  //updatePixels();

  //PImage img;
  //img = loadImage("img.png");

  //img.loadPixels();
  //img.pixels[0];
  //img.updatePixels();
}

void draw() {
  background(255);
  //loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; i < height; j++) {
      stroke(random(255));
      point(i, j);
      //int idx = i + j * width;
      //pixels[idx] = color(random(255));
    }
  }
  //updatePixels();
}
