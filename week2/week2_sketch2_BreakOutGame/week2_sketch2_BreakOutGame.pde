int COLS = 20;
int ROWS = 15;
int w = 400;
int h = 400;
int ball;
//int CELLSIZE = 20;
int cellWidth = 40;
int cellHeight = 20;
PVector [][] Bricks = new PVector[COLS][ROWS];
boolean [][] isActive = new boolean[COLS][ROWS];

Ball myBall;
Paddle myPaddle;

//float paddlePosition = 0;
float paddleSpeed = 40;

void setup() {
  size(800, 800);

  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      Bricks[i][j] = new PVector(i * cellWidth, j * cellHeight);
      isActive[i][j] = true;
    }
  }

  myBall = new Ball(width/2, 500, 30, 3, 3);
  myPaddle = new Paddle(width/2, 600, 100, 10);
}

void draw() {
  background(0);
  for (int i= 0; i < COLS; i++) {
    for (int j= 0; j< ROWS; j++) {
      if (isActive[i][j]) {
        if (myBall.x > Bricks[i][j].x && myBall.x < Bricks[i][j].x + cellWidth) {
          if (myBall.y - (Bricks[i][j].y + cellHeight) < myBall.r/2 && myBall.y - (Bricks[i][j].y + cellHeight) > 0) {
            isActive[i][j] = false;
            myBall.velY *= -1;
          }
          if (Bricks[i][j].y - myBall.y < myBall.r/2 && Bricks[i][j].y - myBall.y > 0) {
            isActive[i][j] = false;
            myBall.velY *= -1;
          }
        }
      }
      if (isActive[i][j]) {
        rect(Bricks[i][j].x, Bricks[i][j].y, cellWidth, cellHeight);
      }
    }
  }

  myBall.update();
  myBall.display();
  myPaddle.update();
  myPaddle.display(myPaddle.x);
  bouncingBall();
}

void keyPressed() {

  if (key==CODED) {
    if (keyCode == RIGHT) {
      myPaddle.x += paddleSpeed;
    } else if (keyCode == LEFT) {
      myPaddle.x -= paddleSpeed;
    } 
  }
  if (key == ' '){
    myBall.x = width/2;
    myBall.y = 500;
  }
  if (myPaddle.x < 0) {
    myPaddle.x = 0;
  } else if (myPaddle.x > width - 80) {
    myPaddle.x = width - 80;
  }
}

void bouncingBall() {
  if (myBall.x < 0 + myBall.r/2) {
    myBall.velX *= -1;
  } else if (myBall.x > width - myBall.r/2) {
    myBall.velX *= -1;
  } else if (myBall.y < 0 + myBall.r/2) {
    myBall.velY *= -1;
  }
  if (myBall.x > myPaddle.x && myBall.x < myPaddle.x + myPaddle.w) {
    if (myPaddle.y - myBall.y < myBall.r/2 && myPaddle.y - myBall.y > dist(0, myBall.r/2, 0, myPaddle.h)) {
      myBall.velY *= -1;
    }
  }
}
