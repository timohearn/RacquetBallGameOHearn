// Pong Example From Class

// Variables
float circleX=random(width);// ball starts at random x
float circleY=height*.15;// ball start point
float gap; // to have paddle away from bottom
float paddleX;// paddle X movement 
float speedX= 2; 
float speedY=2;
float paddleHeight=15; 
float paddleWidth=75; 
int score=0;
float red;
float blue;
float green;
boolean gameover;
boolean movementX; //variable for right direction movement of ball
boolean movementY;// variable for left direction movement of ball 

// background 
void setup() {
  size(800, 400);
}

void draw() {
  red=random(255);
  blue=random(255);
  green=random(255);
  gap=height-50;
  paddleX=mouseX;// paddle move w mouse
  textAlign(CENTER, CENTER);
  textSize(30);
  if (mousePressed==false) {
    background(50); // replace background to make ranbow
  }   
  // writing code for the text that will have score
  fill(0, 255, 0);//scoreboard color
  text("SCORE = ", width*.88, height*.05);
  text(score, width*.97, height*.05);

  // building paddle w recatngle and not allowing it to leave screen
  rectMode(CENTER);
  fill(255);
  paddleX=constrain(paddleX, paddleWidth/2, width-(paddleWidth/2));
  rect(paddleX, gap, paddleWidth, paddleHeight);
  // building ball and making it rainbow
  fill(red, blue, green);
  circle(circleX, circleY, 20);



  if (circleY>=gap+50) {
    gameover=true;
  }
  if (gameover==false) {
    if (circleX<=10) {
      movementX=true;
    }
    if (circleX>=width-10) {
      movementX=false;
    }

    // Basic code to make ball move right left up and down 
    // rigth or left

    if (movementX==true) {
      circleX=circleX+speedX;
    } else {
      circleX=circleX-speedX;
    }

    // up or down 
    if (movementY==true) {
      circleY=circleY+speedY;
    } else {
      circleY=circleY-speedY;
    }


    // if ball hits left it will go right
    if (circleX<=10 && circleY<height) {
      movementX=true;
    }
    if (circleX>=width-10 && circleY<height) {
      movementX=false;
    }

    // bounce off top
    if (circleY<=10) { 
      movementY=true;
    }
    // if ball hits left it will go right
    if (circleX<=10) { 
      movementX=true;
    }
    if (circleX>=width-10) {
      movementX=false;
    }
    if (circleY>=gap-20 && circleX>=mouseX-(paddleWidth/2)
      && circleX<=mouseX+(paddleWidth/2)) { 
      movementY=false;
      // ball speeds up if hits paddle
      speedY++;
      speedX++; 
      // score goes up
      score++;
    }
  } else {  
    fill(250, 30, 30);
    text("GAME OVER", width/2, height/3);
    text("!!!PRESS ANY KEY TO PLAY AGAIN!!!", width*.5, height/2);
    speedY=0; 
    speedX=0;
  }


  // re initializ3s game start
  if (keyPressed && gameover==true) { 
    circleX=random(width);
    circleY=height*.15;
    speedX=2;
    speedY=2;
    gameover=false;
    score=0;
  }
}
