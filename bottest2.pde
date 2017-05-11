Robot r;
boolean turningl;
boolean turningr;

void setup() {
  size(1280, 1024, P2D);
  PVector start = new PVector(width/2, height/2, 0);
  r = new Robot(start, 10, 20);
  turningl = false;
  turningr = false;
}

void keyPressed() {

  if (keyCode == UP) {
    r.addAcc(new PVector(0, -1, 0));
  }
  if (keyCode == LEFT) {
    r.addAcc(new PVector(-1, 0, 0));
  }
  if (keyCode == RIGHT) {
    r.addAcc(new PVector(1, 0, 0));
  }
  if (keyCode == DOWN) {
    r.addAcc(new PVector(0, 1, 0));
  }

  if (key == 'w') {
    if(r.vel.mag() == 0){
       PVector p = new PVector(1,0).rotate(r.angle);
        r.vel = new PVector(p.x,p.y,0);
    }
    r.multVel(1.25);;
  }
  if (key == 'a') {
    //r.angle += -.1;
    turningl = true;
  }
  if (key== 'd') {
    //r.angle += .1;
    turningr = true;
  }
  if (key == 's') {
    if(r.vel.mag() == 0){
       PVector p = new PVector(-1,0).rotate(r.angle);
        r.vel = new PVector(p.x,p.y,0);
    }
    r.multVel(1.25);;  }
}

void keyReleased() {
  if (key == 'w' || key == 's') {
    r.vel = new PVector(0,0,0);
  }
  if (key == 'a') {
    turningl = false;;
  }
  if (key == 'd'){
    turningr = false;
   }
}

void draw() {
  r.update();
  r.drawRobot();
}