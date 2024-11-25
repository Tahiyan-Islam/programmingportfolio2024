class Powerup {
  //Member Variables
  int x, y, speed, diam;
  char type;
  PImage p1;

  //Constructor
  Powerup () {
    x = int (random(width));
    y = -200;
    diam = int(random(20, 75));
    speed = int(random(1, 5));
    p1 = loadImage("Powup1.png");
    int rand = int(random(2));
    if (rand == 0) {
      type = 'h';
      //pu1 = loadImage("health.png");
    } else if (rand == 1) {
      type = 'a';
    }
  }

  void display () {
    if (type == 'h') {
      p1 = loadImage("Powup1.png");
    } else if (type == 'a') {
      p1 = loadImage("Powup2.png");
    }
    p1.resize(diam,diam);
    image(p1,x,y);
  }

  void move () {
    y = y + speed;
  }

  boolean reachedBottom () {
    if (y >height + 200) {
      return true;
    } else {
      return false;
    }
  }


  boolean intersect (Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d < 50) {
      return true;
    } else {
      return false;
    }
  }
}
