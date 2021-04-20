class Button {
  // Member Variable
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean hover, isNumber;

  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c1 = #4068D3;
    c2 = #B4C6F7;
    val = tempVal;
    hover = false;
    this.isNumber = isNumber;
  }

  // Display Method
  void display() {
    if (isNumber) { // formatting buttons as numbers
      if (hover) {
        fill(c2);
      } else {
        fill(c1);
      }
      if (val.equals("1")) {
        triangle(x, y-10, x+10, y+10, x-10, y+10);
      } else if (val.equals("2")) {
        triangle(x, y-10, x+10, y+10, x-10, y+10);
      }

      fill(0);
      textSize(14);
      text(val, x+10, y+30);
    } else { // formatting buttons as operators
      if (hover) {
        fill(c2);
      } else {
        fill(c1);
      }
      rect(x, y, w, h, 8);
      fill(0);
      textSize(14);
      text(val, x+10, y+30);
    }
  }


  // Hover Method
  void hover() {
    hover = (mouseX > x && mouseX<x+w && mouseY>y && mouseY <y+h);
  }
}
