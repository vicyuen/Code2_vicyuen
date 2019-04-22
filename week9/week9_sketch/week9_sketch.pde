ArrayList<Corgi> corgi = new ArrayList<Corgi>();
PImage shiba;
Table table;
int state = 0;

void setup() {
  size(500, 500, P3D);
  table = loadTable("mass.csv", "header");

  for (TableRow row : table.rows()) {
    int m = row.getInt("mass");
    corgi.add(new Corgi(m));
  }
  shiba = loadImage("shiba.png");
}

void draw() {
  background(255);
  if (state == 0) {
    for (Corgi c : corgi) {
      c.update();
      c.display();
    }
    pushMatrix();
    shiba.resize(100, 0);
    noStroke();
    beginShape();
    texture(shiba);

    translate(width/2, height/2, 0);
    vertex(10, 20, 0, 0);
    vertex(80, 5, 100, 0);
    vertex(95, 90, 100, 100);
    vertex(40, 95, 0, 100);
    endShape();
    popMatrix();
  }
  if (state == 1) {

    PVector shibaPos = new PVector(mouseX - 50, mouseY - 50, 10);
    pushMatrix();
    shiba.resize(100, 0);
    noStroke();
    beginShape();
    texture(shiba);

    translate(shibaPos.x, shibaPos.y, shibaPos.z);
    vertex(10, 20, 0, 0);
    vertex(80, 5, 100, 0);
    vertex(95, 90, 100, 100);
    vertex(40, 95, 0, 100);
    endShape();
    popMatrix();

    for (Corgi c : corgi) {
      //Jerry j = jerry.get(0);
      //j.pos = new PVector(mouseX, mouseY);
      shibaPos.sub(c.pos);
      shibaPos.normalize();
      shibaPos.mult(0.1);

      c.applyForce(shibaPos);
      c.update();
      c.display();
    }
  }
}

void keyPressed() {
  if (key == ' ' && state == 0) {
    state = 1;
  }
}
