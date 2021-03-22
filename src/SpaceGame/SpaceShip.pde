class SpaceShip {
  // member variables
  int x,y,health,lives,rad;
  color c;
  float easing;

  // constructor
  SpaceShip(color c) {
    x = 0;
    y = 0;
    health = 100;
    lives = 3;
    this.c = c;
    easing = 0.05;
    rad = 25;
  }
  
  // Rock vs Ship Collision
  boolean rockIntersection(Rock rock){
    float distance = dist(x,y,rock.x,rock.y);
    if(distance < rad + rock.rad) {
      return true;
    } else {
      return false;
    }
  }

  // member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    rectMode(CENTER);
    stroke(127);
    fill(c);
    rect(x+20, y+15, 10, 15);
    rect(x-20, y+15, 10, 15);
    line(x+35, y+10, x+35, y);
    line(x-35, y+10, x-35, y);
    fill(100);
    triangle(x, y-15, x+40, y+15, x-40, y+15);
    fill(200);
    ellipse(x, y, 20, 80);
  }
}
