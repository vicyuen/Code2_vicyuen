Player player;
Ball ball;
//Brick[][] bricks = new Brick[10][5];
int col = 10;
int row = 5;
ArrayList<BrickC1> brick1 = new ArrayList<BrickC1>();
ArrayList<BrickC2> brick2 = new ArrayList<BrickC2>();

boolean rightPressed = false;
boolean leftPressed = false;

void setup() {
  size(900, 600);
  //colorMode(HSB, 100);
  player = new Player();
  ball = new Ball();

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      //bricks[i][j] = new Brick(5 + i * 90, 50 + j * 40, 80, 20);
      int r = int(random(0, 2));
      if (r == 0) {
        brick1.add(new BrickC1(5 + i * 90, 50 + j * 40, 80, 20));
      } else if (r == 1) {
        brick2.add(new BrickC2(5 + i * 90, 50 + j * 40, 80, 20));
      }
    }
  }
}

void draw() {
  background(10);
  player.update();
  player.display();

  ball.update();
  ball.display();


  // does it make sense for ball to own this?
  if (ball.pos.x > player.x - player.w/2 && ball.pos.x < player.x + player.w/2 &&
    ball.pos.y > player.y - player.h/2 && ball.pos.y < player.y + player.h/2) {

    ball.angle = random(PI, TWO_PI);
    ball.vel = new PVector(cos(ball.angle), sin(ball.angle));
    ball.vel.mult(ball.speed);
    ball.pos.add(ball.vel);
  }

  //for (int i = 0; i < bricks.length; i++) {
  //  for (int j = 0; j < bricks[0].length; j++) {
  //    if (bricks[i][j].active) {
  //      bricks[i][j].display();
  //      if (ball.didCollideWithBrick(bricks[i][j])) {
  //        bricks[i][j].active = false;
  //      }
  //    }
  //  }
  //}

  for (int i = 0; i < brick1.size(); i++) {
    BrickC1 brickC1 = brick1.get(i);
    if (brickC1.active) {
      brickC1.display();
      if (ball.didCollideWithBrick(brickC1)) {
        brickC1.active = false;
      }
    }
  }
  
    for (int i = 0; i < brick2.size(); i++) {
    BrickC2 brickC2 = brick2.get(i);
    if (brickC2.active) {
      brickC2.display();
      if (ball.didCollideWithBrick(brickC2)) {
        brickC2.active = false;
      }
    }
  }
}
