class Spaceship {
  //Member Variables
  int x, y, w, health, laserCount, turretCount;

  //Constructor
  Spaceship() {
    x = width/2;
    y = height/2;
    w = 100;
    health = 100;
    laserCount = 10;
    turretCount = 1;
    //ship=loadImage("");
  }


  void display () {
    strokeWeight(3);
    fill(#FFA500);
    rectMode(CORNER);
    //thruster
    rect(x+10, y+20, 15, 20);
    rect(x-25, y+20, 15, 20);
    stroke(80);
    fill(#40E0D0);
    //wing
    triangle(x, y-30, x+45, y+30, x-45, y+30);
    fill(#87A96B);
    //center
    ellipse(x, y, 20, 80);
    //fumes
    fill(#F5F5F5);
    line(x+20, y+50, x+30, y+80);
    line(x+10, y+50, x+20, y+80);
    line(x-10, y+50, x-20, y+80);
    line(x-20, y+50, x-30, y+80);
  }




  void move (int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

  boolean fire () {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect (Rock r) {
    float d = dist(r.x, r.y, x, y);
    if (d < 50) {
      return true;
    } else {
      return false;
    }
  }
}
