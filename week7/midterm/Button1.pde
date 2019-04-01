class Button1 {
  int x;
  int y;
  color button1BG;
  String button1Text;

  Button1(int button1x, int button1y, color buttons1BG, String buttons1Text) {
    x = button1x;
    y = button1y;
    button1BG = buttons1BG;
    button1Text = buttons1Text;
  }

  void display() {
    if (dist(mouseX, mouseY, x, y) < buttonSize/2 && mousePressed) {
      textToShow = button1Text;
      bgColor = button1BG;
      fill(255, 200, 230);
    } else {
      fill(255);
    }
    ellipse(x, y, buttonSize, buttonSize);
  }
}
