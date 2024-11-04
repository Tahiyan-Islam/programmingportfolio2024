class Button {
  // Member Variables
  int w, h, x, y;
  color c1, c2;
  String val;
  boolean on, isNum;
  
  //Constructor
  Button(int x, int y, color c1, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = 40;
    this.h = 30;
    this.isNum = isNum;
    this.c1 = c1;
    c2 = color(120);
    this.val = val;
    on=false;
  }


  // Member Methods
  void display() {
    if (on==true) {
    fill(c2);
    } else {
      fill(c1);
    }
    
    
    rectMode(CENTER);
    rect(x, y, w, h, 5);
    //triangle(x,y-10,x+10, y+10, x-10,y+10);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(13);
    text(val,x,y);
    
  }

  boolean hover (int mx, int my) {
    if (mx > x-w/2 && mx <x + w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
