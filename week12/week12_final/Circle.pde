class Circle {
  PVector pos;
  PVector vel;
  float size;
  color c;

  Circle(float size_, color c_) {
    pos = new PVector(width/2, height/2);
    vel = new PVector(random(-5, 5), random(-5, 5));
    size = size_;
    c = c_;
  }

  void display() {
    fill(c);
    //stroke(#f4f4f4);
    noStroke();
    ellipse(pos.x, pos.y, size, size);
  }
  
  void update(){
    pos.add(vel);
    if(pos.x > width){
      pos.x = 0;
    } else if(pos.x < 0){
     pos.x = width; 
    } else if(pos.y > height){
      pos.y = 0;
    } else if(pos.y < 0){
      pos.y = height;
    }
  }
}
