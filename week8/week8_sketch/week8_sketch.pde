ArrayList<Tom> tom = new ArrayList<Tom>();
ArrayList<Jerry> jerry = new ArrayList<Jerry>();
Table table;

void setup() {
  size(1000, 800);
  table = loadTable("mass.csv", "header");
  jerry.add(new Jerry());
 
 for (TableRow row: table.rows()){
   int m = row.getInt("mass");
   tom.add(new Tom(m));
 }
  //for (int i = 0; i<20; i++ ) {
  //  tom.add(new Tom(int(random(1, 10))));
  //}
}

void draw() {
  background(255);

  for (Jerry j : jerry) {
    j.update();
    j.display();
  }
  for (Tom t : tom) {
    Jerry j = jerry.get(0);
    j.pos = new PVector(mouseX, mouseY);
    j.pos.sub(t.pos);
    j.pos.normalize();
    j.pos.mult(0.1);
    t.applyForce(j.pos);
    t.update();
    t.display();

  }
}
