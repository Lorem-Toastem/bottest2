int MAX_SPEED = 10;
int MAX_ACC = 2;

class Robot {
  PVector pos;
  PVector vel;
  PVector acc;
  float angle;
  
  // int max_speed;

  int wide;
  int high;
  int balls;
  boolean gear;

  //Health

  Robot(PVector p, int w, int h) {
    pos = p;
    wide = w;
    high = h;
    balls = 10;
    angle = 0;
    acc = new PVector(0, 0, 0);
    vel = new PVector(0, 0, 0);
  }

  void update() {
    //vel.add(acc);
    vel.limit(MAX_SPEED);
    
    if (turningl){
      rotateVel(-.1);
    }
    if (turningr){
      rotateVel(.1);
    }
    //rotateVel();
    //angle = vel.heading();
    pos.add(vel);
  }

  void addAcc(PVector v) {
    acc.add(v);
    acc.limit(MAX_ACC);
  }

  void multVel(float x){
    vel.mult(x);
    vel.limit(MAX_SPEED);
  }

  void noXAcc() {
    acc.x = 0;
    vel.x = 0;
  }

  void noYAcc() {
    acc.y = 0;
    vel.y = 0;
  }
  
  void keyUnpressed(){
    angle = vel.heading();
  }
  
  //if there is no acc, sets it to a value and then rotates it based on the direction the robot is facing
  void multAcc(float x){
    acc.mult(x);
  }

  void addAngle(float r) {
    angle += r;
    vel.rotate(r);
  }
  
  void rotateVel(float a){
    //PVector p = new PVector(0.0,1).rotate(a);
    //PVector v = new PVector(p.x,p.y,0);
    //p = new PVector(vel.x,vel.y).rotate(PVector.angleBetween(v,vel));
   PVector p = new PVector(vel.x,vel.y).rotate(a);
    vel = new PVector(p.x, p.y, 0);
    angle += a;
    //angle = vel.heading();
  }



  void drawRobot() {
    rectMode(CENTER);
    translate(pos.x, pos.y);
    rotate(angle);
    translate(-pos.x, -pos.y);
    rect(pos.x, pos.y, wide, high);
    rotate(angle);

  }
}