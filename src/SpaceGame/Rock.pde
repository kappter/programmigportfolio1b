class Rock {
  // member variables
  int x, y, health, speed, rad;
  PImage photo;

  // constructor
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    health = 25;
    speed = int(random(2, 5));
    photo = loadImage("rock1.png");
    rad = 25;
  }
  
  // Laser vs Rock Intersection
  boolean laserIntersection(Laser l){
    float distance = dist(x,y,l.x,l.y);
    if(distance < rad + l.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y > height + 50) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y+=speed;
  }

  // member methods
  void display() {
      image(photo, x, y);
  }
}
