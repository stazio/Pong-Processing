final int 
  PADDLE_WIDTH = 10, 
  PADDLE_HEIGHT = 75, 
  BALL_RADIUS = 10;

Position posHumanPaddle;
Motion ball, posAIPaddle;

/**
 0 - Intro
 1 - InGame
 2 - Pause
 3 - You Loose
 4 - You Win
 **/
int STATE = 0;

void setup() {
  size(600, 400);
  posAIPaddle = new Motion(10, (height - PADDLE_HEIGHT)/2, 0, 0);
  posHumanPaddle = new Position(width - PADDLE_WIDTH - 10, (height - PADDLE_HEIGHT)/2);
  ball = new Motion(width/2, height/2, 2, 0);
}

void draw() {
  clear();
  fill(255);
  noStroke();
  drawField();
  drawBall();
  drawAIPaddle();
  drawHumanPaddle();

  if (STATE == 0) {
    introState();
  } else if (STATE == 1) {

    updateAIPaddle();
    updateBall();
  } else if (STATE == 3) {
    text("You Loose", width/2, height/2);
  } else if (STATE == 4) { 
    text("You Win!", width/2, height/2);
  }
}

void drawField() {
}

void drawBall() {
  ellipse(ball.x, ball.y, BALL_RADIUS*2, BALL_RADIUS*2);
}

void updateBall() {
  ball.update(2);
  if (ball.y + BALL_RADIUS >= height)
    ball.dy = -ball.dy;
  else if (ball.y <= BALL_RADIUS)
    ball.dy = -ball.dy;

  if (ball.x - BALL_RADIUS >= posAIPaddle.x && ball.x - BALL_RADIUS <= posAIPaddle.x + PADDLE_WIDTH) {
    if (ball.y + BALL_RADIUS >= posAIPaddle.y && ball.y - BALL_RADIUS <= posAIPaddle.y + PADDLE_HEIGHT) {
      ball.dx = -ball.dx;
      ball.dy = (ball.y - (posAIPaddle.y + PADDLE_HEIGHT/2)) * 0.05;
    }
  }
  if (ball.x + BALL_RADIUS >= posHumanPaddle.x && ball.x + BALL_RADIUS <= posHumanPaddle.x + PADDLE_WIDTH) {
    if (ball.y + BALL_RADIUS >= posHumanPaddle.y && ball.y - BALL_RADIUS <= posHumanPaddle.y + PADDLE_HEIGHT) {
      ball.dx = -ball.dx;
      ball.dy = (ball.y - (posHumanPaddle.y + PADDLE_HEIGHT/2)) * 0.05;
    }
  }

  if (ball.x - BALL_RADIUS > width)
    STATE = 3;
  else if (ball.x + BALL_RADIUS < 0)
    STATE = 4;
}

void drawAIPaddle() {
  rectMode(CORNER);
  rect(posAIPaddle.x, posAIPaddle.y, PADDLE_WIDTH, PADDLE_HEIGHT);
}

void drawHumanPaddle() {
  rectMode(CORNER);
  rect(posHumanPaddle.x, posHumanPaddle.y, PADDLE_WIDTH, PADDLE_HEIGHT);
}

void updateAIPaddle() {
  posAIPaddle.update(1);
  if (posAIPaddle.y + PADDLE_HEIGHT/2 < ball.y - 1)
    posAIPaddle.dy = 2.5;
  else if (posAIPaddle.y + PADDLE_HEIGHT/2 > ball.y + 1)
    posAIPaddle.dy = -2.5;
  else
    posAIPaddle.dy = 0;

  if (posAIPaddle.y >= height - PADDLE_HEIGHT)
    posAIPaddle.y = height - PADDLE_HEIGHT;
  else if (posAIPaddle.y <= 0)
    posAIPaddle.y = 0;
}

void keyPressed() {
  if (keyCode == UP)
    posHumanPaddle.y -= 15;
  else if (keyCode == DOWN)
    posHumanPaddle.y += 15;
}