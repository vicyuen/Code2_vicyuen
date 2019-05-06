//PGraphics is an instance of Processing API
PGraphics pg;

void setup() {
  size(600, 600);
  background(255, 100, 120);
  pg = createGraphics(300, 300);
}

void draw() {
  pg.beginDraw();
  pg.background(100, 150, 255);
  pg.rect(mouseX, mouseY, pg.width - 50, pg.height - 100);
  pg.loadPixels();
  for (int i = mouseX; i < mouseX + 150; i++) {
    for (int j = mouseY; j < mouseY + 100; j++) {
      int index = i + j * pg.width;
      pg.pixels[index] = color(random(255));
    }
    pg.updatePixels();
    pg.endDraw();
    image(pg, 0, 0);
  }
}
