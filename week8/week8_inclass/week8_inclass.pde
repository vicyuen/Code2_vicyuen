
Mover[] mover = new Mover[500]; 

void setup() {
  size(1000, 800);
  for (int i = 0; i < 500; i++) {
    mover[i] = new Mover();
  }
}

void draw() {
  background(255);
  PVector gravity = new PVector(0, 0.1);

  for (int i = 0; i < 500; i++) {
    //mover[i].applyForce(gravity);

    //PVector wind = new PVector(-0.1, 0);
    //mover.applyForce(wind);

    PVector mouse = new PVector(mouseX, mouseY);
    mouse.sub(mover[i].pos);
    mouse.normalize();
    mouse.mult(0.1);
    mover[i].applyForce(mouse);
    //line(mouseX, mouseY, mover.pos.x, mover.pos.y);

    mover[i].update();
    mover[i].display();
  }
}
