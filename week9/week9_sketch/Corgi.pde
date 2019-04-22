class Corgi {
  PVector pos;
  PVector vel;
  PVector acc;
  PImage corgiIMG;
  int mass;

  Corgi(int m) {
    corgiIMG = loadImage("corgi.png");
    pos = new PVector(random(0, width), random(0, height), -random(0, 10));
    vel = new PVector(0, 0, 0);
    acc = new PVector(0, 0, 0);
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

    if (pos.x >= width - corgiIMG.width/2) {
      pos.x = width - corgiIMG.width/2;
      vel.x *= -1;
    } else if (pos.x <= corgiIMG.width/2) {
      pos.x = corgiIMG.width/2;
      vel.x *= -1;
      //pos.x = 0;
    }

    if (pos.y >= height - corgiIMG.height/2) {
      pos.y = height - corgiIMG.height/2;
      vel.y *= -1;
    } else if (pos.y <= corgiIMG.height/2) {
      pos.y = corgiIMG.height/2;
      vel.y *= -1;
      //pos.y = 0;
    }
  }

  void display() {
    int imageWidth = int(map(mass, 1, 20, 10, 50));
    //pushMatrix();
    //imageMode(CENTER);
    ////translate(pos.x, pos.y);
    ////rotate(vel.heading());
    ////translate(0, 0);
    //corgiIMG.resize(imageWidth, 0);
    //image(corgiIMG, pos.x, pos.y);
    //popMatrix();

    pushMatrix();
    corgiIMG.resize(100, 0);
    noStroke();
    beginShape();
    texture(corgiIMG);

    translate((pos.x - 50), (pos.y - 50), pos.z);
    vertex(10 - imageWidth, 20 - imageWidth, 0, 0);
    vertex(80 + imageWidth, 5 + imageWidth, 100, 0);
    vertex(95 + imageWidth, 90 + imageWidth, 100, 100);
    vertex(40 - imageWidth, 95 - imageWidth, 0, 100);
    endShape();
    popMatrix();

  }
}
