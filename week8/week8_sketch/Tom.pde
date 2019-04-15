class Tom {
  PVector pos;
  PVector vel;
  PVector acc;
  PImage tomIMG;
  int mass;

  Tom(int m) {
    tomIMG = loadImage("tom.png");
    pos = new PVector(random(0, width), random(0, height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mass = m;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); 
    acc.add(f);
  }
  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);

    if (pos.x >= width - tomIMG.width/2) {
      pos.x = width - tomIMG.width/2;
      vel.x *= -1;
    } else if (pos.x <= tomIMG.width/2) {
      pos.x = tomIMG.width/2;
      vel.x *= -1;
      //pos.x = 0;
    }

    if (pos.y >= height - tomIMG.height/2) {
      pos.y = height - tomIMG.height/2;
      vel.y *= -1;
    } else if (pos.y <= tomIMG.height/2) {
      pos.y = tomIMG.height/2;
      vel.y *= -1;
      //pos.y = 0;
    }
  }

  void display() {
    int imageWidth = int(map(mass, 1, 20, 150, 450));
    pushMatrix();
    imageMode(CENTER);
    //translate(pos.x, pos.y);
    //rotate(vel.heading());
    translate(0, 0);
    tomIMG.resize(imageWidth, 0);
    image(tomIMG, pos.x, pos.y);
    popMatrix();
  }
}
