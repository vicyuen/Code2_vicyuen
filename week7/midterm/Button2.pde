class Button2 {
  int x;
  int y;
  color button2BG;
  String button2Text;

  Button2(int button2x, int button2y, color buttons2BG, String buttons2Text) {
    x = button2x;
    y = button2y;
    button2BG = buttons2BG;
    button2Text = buttons2Text;
  }

  void display() {
if (dist(mouseX, mouseY, x, y) < buttonSize/2 && mousePressed) {
    textToShow = button2Text;
    bgColor = button2BG;
    fill(150, 255, 255);
  } else {
    fill(255);
  }
  ellipse(x, y, buttonSize, buttonSize);

  fill(0);
  textAlign(CENTER);
  textSize(28);
  text(textToShow, width/2, 400);
  }
}
