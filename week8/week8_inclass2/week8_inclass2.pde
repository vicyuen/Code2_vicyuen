
ArrayList<Mover> movers = new ArrayList<Mover>(); 
ArrayList<Attractor> attractors = new ArrayList<Attractor>();

void setup() {
  colorMode(HSB);
  size(1000, 600);
  for (int i = 0; i < 50; i++) {
    movers.add(new Mover());
  }
}

void draw() {
  background(255);
  
  for (Mover mover : movers) {
    //PVector gravity = new PVector(0, 0.1 * mover.mass);
    //mover.applyForce(gravity);
    
    PVector friction = mover.vel.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(0.05);
    //mover.applyForce(friction);

    //PVector wind = new PVector(-0.1, 0);
    //mover.applyForce(wind);

    //PVector mouse = new PVector(mouseX, mouseY);
    //mouse.sub(mover.pos);
    //mouse.normalize();
    //mouse.mult(0.1);
    //mover.applyForce(mouse);
    
    for (Attractor a : attractors) {
      PVector aForce = new PVector(a.pos.x, a.pos.y);
      aForce.sub(mover.pos);
      aForce.normalize();
      aForce.mult(0.1);
      mover.applyForce(aForce);
      //stroke(map(, 50);
      line(mover.pos.x, mover.pos.y, a.pos.x, a.pos.y);
      a.display();
    }

    mover.update();
    mover.display();
  }
}

void keyPressed() {
  for (Mover mover : movers) {
    PVector jump = new PVector(0, -20);
    mover.applyForce(jump);
  }
}

void mousePressed() {
  attractors.add(new Attractor(mouseX, mouseY));
}

class Attractor {
  PVector pos; 
  
  Attractor(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void display() {
    rectMode(CENTER);
    fill(255);
    rect(pos.x, pos.y, 10, 10);
  }
  
}

class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  color c;
  
  Mover() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0,0);
    acc = new PVector(0, 0);
    mass = random(2, 5);
    c = color(color(0, 0, 255), random(255), random(255));
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); 
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    } else if (pos.x < 0) {
      vel.x *= -1;
      pos.x = 0;
    }

    if (pos.y > height) {
      vel.y *= -1;
      pos.y = height;
    } else if (pos.y < 0) {
      vel.y *= -1;
      pos.y = 0;
    }
  }
  
  void display() {
    fill(c);
    ellipse(pos.x, pos.y, 10 * mass, 10 * mass);
  }
}
