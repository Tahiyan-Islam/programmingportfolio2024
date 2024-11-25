//Tahiyan Islam | Calc Project | 2 Oct 2024
Button [] buttons = new Button[25];
String dVal = "0";
char op;
float l, r, result;
boolean left;

void setup () {
  size(270, 250);
  background(140);
  left = true;
  op = ' ';
  l = 0;
  r =0;
  result = 0;
  buttons [0]= new Button (35, 220, color(#FFC0CB), "0", true);
  buttons [1] = new Button (35, 180, color(#FFC0CB), "1", true);
  buttons [2] = new Button (85, 180, color (#FFC0CB), "2", true);
  buttons [3] = new Button (135, 180, color (#FFC0CB), "3", true);
  buttons [4] = new Button (35, 140, color (#FFC0CB), "4", true);
  buttons [5] = new Button (85, 140, color (#FFC0CB), "5", true);
  buttons [6] = new Button (135, 140, color (#FFC0CB), "6", true);
  buttons [7]= new Button (35, 100, color (#FFC0CB), "7", true);
  buttons [8] = new Button (85, 100, color (#FFC0CB), "8", true);
  buttons [9] = new Button (135, 100, color (#FFC0CB), "9", true);
  buttons [10] = new Button (35, 60, color(#FFA500), "C", false);
  buttons [11] = new Button (110, 60, color(#deff00), "+\n-", false);
  buttons [12] = new Button (835, 60, color(#DAB1DA), "√n", false);
  buttons [13] = new Button (835, 60, color(#DAB1DA), "^-n", false);
  buttons [14] = new Button (235, 60, color(#DAB1DA), "%", false);
  buttons [15] = new Button (85, 220, color(#deff00), ".", false);
  buttons [16] = new Button (135, 220, color(#deff00), "=", false);
  buttons [17] = new Button (185, 220, color(#deff00), "+", false);
  buttons [18] = new Button (185, 180, color(#deff00), "-", false);
  buttons [19] = new Button (185, 140, color(#deff00), "÷", false);
  buttons [20] = new Button (185, 80, color(#deff00), "x", false);
  buttons [21] = new Button (235, 100, color(#DAB1DA), "π", false);
  buttons [22] = new Button (235, 140, color(#DAB1DA), "√", false);
  buttons [23] = new Button (235, 180, color(#DAB1DA), "^", false);
  buttons [24] = new Button (235, 220, color(#FFA500), "Del", false);
  buttons[11].w = 90;
  buttons[20].h = 70;
}

void draw () {
  background(140);
  println("Left:" + l + " Op:" + op + " Right:" + r + " Result:" + result  + " left:"  + left);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}

void updateDisplay () {
  rectMode(CENTER);
  fill(222);
  rect(width/2, 25, 240, 30);
  fill(0);
  if (dVal.length()<13) {
    textSize(12);
  } else if (dVal.length()>14) {
    textSize(20);
  }
  textAlign(RIGHT);
  text(dVal, width-50, 25);
}
//wherever you see isnum replace with i < 9
void mousePressed () {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length() < 20) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        println("here");
        l = float(dVal);
      } else {
        dVal += buttons[i].val;
        l = float(dVal);
      }
    } else if (buttons[i].on && buttons[i].isNum && !left && dVal.length() < 20) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        println("here");
        r = float(dVal);
      } else {
        dVal += buttons[i].val;
        r = float(dVal);
      }
    } else if (buttons[i].val.equals("C") && buttons[i].on) {
      dVal = "0";
      op = ' ';
      l = 0;
      r =0;
      result = 0;
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      op = '+';
      left = !left;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      op = '-';
      dVal = "0";
      left = !left;
    } else if (buttons[i].on && buttons[i].val.equals("x")) {
      op = 'x';
      left = !left;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      op = '÷';
      left = !left;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal =str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+\n-")) {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal =str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals(".")) {
      if (!dVal.contains(".") && left) {
        dVal += ".";
        l = float(dVal);
      } else if (!dVal.contains(".") && !left) {
        dVal += ".";
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      performCalc();
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("Del")) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() -1);
        l= float (dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() -1);
        r = float (dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal =str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l = l * 0.01;
        dVal = str(l);
      } else {
        r = r*0.01;
        dVal =str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      dVal = "0";
      op = '^';
      left = false;
    }
  }
}



void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '^') {
    result = pow(l, r);
  }
  dVal = str (result);
}

void handleEvent (String keyVal, boolean isNum) {
  //handle numbers
  if (left && dVal.length() <20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal +=keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length() <20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r = float(dVal);
  } else if (keyVal.equals(".")) {
    if (!dVal.contains(".") && left) {
      dVal+= ".";
      l = float(dVal);
    } else if (!dVal.contains(".") && !left) {
      dVal += ".";
      r= float(dVal);
    }
  } else if (keyVal.equals("+")) {
    op = '+';
    left = !left;
    dVal = "0";
  } else if (keyVal.equals("-")) {
    op = '-';
    left = !left;
    dVal = "0";
  } else if (keyVal.equals("x")) {
    op = 'x';
    left = !left;
    dVal = "0";
  } else if (keyVal.equals("÷")) {
    op = '÷';
    left = !left;
    dVal = "0";
  } else if (keyVal.equals("=")) {
    performCalc();
  }
}



void keyPressed () {
  println("key:" + key);
  println("keycode:" + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (keyCode == 97 || keyCode == 49) {
    handleEvent ("1", true);
  } else if (keyCode == 98 || keyCode == 50 ) {
    handleEvent ("2", true);
  } else if (keyCode == 99 || keyCode == 51) {
    handleEvent ("3", true);
  } else if (keyCode == 100 || keyCode == 52) {
    handleEvent ("4", true);
  } else if (keyCode == 101 || keyCode == 53 ) {
    handleEvent ("5", true);
  } else if (keyCode == 102 || keyCode == 54) {
    handleEvent ("6", true);
  } else if (keyCode == 103 || keyCode == 55) {
    handleEvent ("7", true);
  } else if (keyCode == 104 || keyCode == 56) {
    handleEvent ("8", true);
  } else if (keyCode == 105 || keyCode == 57) {
    handleEvent ("9", true);
  } else if (keyCode == 61) {
    handleEvent ("=", false);
  } else if (keyCode == 110 || keyCode == 46) {
    handleEvent (".", false);
  } else if (keyCode == 107) {
    handleEvent ("+", false);
  } else if (keyCode == 45 || keyCode == 189) {
    handleEvent ("-", false);
  } else if (keyCode == 88) {
    handleEvent ("x", false);
  } else if (keyCode == 61 || keyCode == 10) {
    handleEvent ("=", false);
  } else if (keyCode == 46  || keyCode == 110) {
    handleEvent (".", false);
  }
}
