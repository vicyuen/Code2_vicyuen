final int NUM_SHAPES = 15;

Vert[] verts = new Vert[NUM_SHAPES];

void setup(){
  size(600, 600);
  
    for (int i = 0; i < NUM_SHAPES; i++) {
      verts[i] = new Vert(i);
    }
}

void draw(){
    for (int i = 0; i < NUM_SHAPES; i++) {
      verts[i].display();
    }
}

class Vert {
  float x;
  float h;
  color c;
  
  Vert(int i){
    x = map(i, 0, NUM_SHAPES, 30, width);
    h = random(100, 300);
    c = color(map(i, 0, NUM_SHAPES, 0, 255));
  }
  
  void display(){
    rectMode(CENTER);
    fill(c);
    rect(x, height/2, 20, h);
  }
}
