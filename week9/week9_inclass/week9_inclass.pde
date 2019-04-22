void setup() {
  size(600, 600, P3D); // let processing use another render system
  rect(0, 0, 300, 300);
}

void draw() {
  background(255);

  translate(width/2, height/2, -mouseX);
  rectMode(CENTER);
  rotateX(radians(frameCount*0.5));
  rotateY(radians(frameCount*0.3));
  rotateZ(radians(frameCount*0.1));
  //rect(mouseX, 0, 300, 300);

  //line(-100, -100, 0, 100, -100, 0);
  //line(100, -100, 0, 100, 100, 0);
  //line(100, 100, 0, -100, 100, 0);
  //line(-100, 100, 0, -100, -100, 0);

  //line(-100, -100, -100, 100, -100, -100);
  //line(100, -100, -100, 100, 100, -100);
  //line(100, 100, -100, -100, 100, -100);
  //line(-100, 100, -100, -100, -100, -100);

  //line(-100, -100, 100, -100, -100, -100);
  //line(100, -100, 100, 100, -100, -100);
  //line(100, 100, 100, 100, 100, -100);
  //line(-100, 100, 100, -100, 100, -100);
  
  sphereDetail(10);
  sphere(100);
}
