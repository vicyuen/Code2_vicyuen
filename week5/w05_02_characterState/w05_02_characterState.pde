// bryan ma for code 2 sp 19

Character c;

float floor;

void setup() {
  size(800, 800);
  colorMode(HSB);
  floor = (height*2)/3;
  c = new Character();
  textSize(20);
  textAlign(CENTER);
  //strokeWeight(3);
}

void draw() {
  background(250);
  stroke(0);
  fill(100);
  rect(0, (height*2)/3, width, height);

  fill(0);
  text("Press space to jump", width/2, 100);
  text("Hold 'w' to fly", width/2, 150);

  text("state: " + c.state, 450, floor - 50);

  c.update();
  c.display();
}

void keyPressed() {
  c.handleInput(key);
}

class Character {
  int state;  // 0 - standing, 1 - in air
  PVector pos;
  PVector vel;
  float grav;
  float w;
  float h;
  float baseh;

  Character() {
    w = 120;
    h = 100;
    baseh = 100;
    grav = 0.9;
    pos = new PVector(300, floor - baseh/2);
    vel = new PVector(0, 0);
  }

  void display() {
    switch (state) {
    case 0:
      fill(200, 150, 70);
      break;
    case 1:
      fill(200, 70, 190);
      break;
    case 2:
      fill(50, 50, 100);
      break;
    default:
      break;
    }

    noStroke();
    h += ((baseh + vel.y * 2) - h) * 0.3;
    ellipse(pos.x, pos.y, w, h);

    fill(250);
    noStroke();
    ellipse(pos.x - 5, pos.y - 10, 20, 30);
    ellipse(pos.x + 30, pos.y - 10, 20, 30);

    fill(0);
    ellipse(pos.x - 5, pos.y - 10, 10, 10 + abs(vel.y));
    ellipse(pos.x + 30, pos.y - 10, 10, 10 + abs(vel.y));
  }


  void update() {
    switch (state) {
    case 0:
      vel.y = 0;
      break;
    case 1:
      pos.add(vel);
      vel.y += grav;
      if (pos.y + vel.y > floor - baseh/2) {
        state = 0;
        pos.y = floor - baseh/2;
      }
      break;
    case 2:
      //pos.add(vel);
      //vel.y += grav;
      pos.y+=5;
      if (keyPressed) {
        if (key =='w') {
          pos.y -= 20;
        }
      }
      if (pos.y > floor - baseh/2) {
        state = 0;
        pos.y = floor - baseh/2;
      }
      break;
    default:
      break;
    }
  }

  void handleInput(char k) {
    println(k);
    switch (state) {
    case 0:
      if (k == ' ') {
        state = 1;
        vel.y = -20;
      } 
      if (k=='w') {
        state = 2;
        pos.y -= 50;
      }
      break;
    case 1:
      break;
    case 2:
      break;
    default:
      break;
    }
  }
}
