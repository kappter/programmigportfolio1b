// SpaceGame 2020 December
// by Mr Kapptie

SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
Timer timer;
int score;

void setup() {
  size(500, 500);
  s1 = new SpaceShip(#CB741D);
  lasers = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  score = 0;
  timer = new Timer(int(random(500,3000)));
  timer.start();
}

void draw() {
  background(0);
  
  stars.add(new Star(int(random(width)),int(random(height)),color(random(190,255))));
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if(star.reachedBottom()) {
      stars.remove(star);
    }
  }
  
  if(timer.isFinished()) {
    rocks.add(new Rock(int(random(width)),-50));
    timer.start();
  }
  
  // add remove code
  for (int i = 0; i < rocks.size(); i++) {
    Rock rock = rocks.get(i);
    rock.display();
    rock.move();
    // Rock vs Ship Collision
    if(s1.rockIntersection(rock)) {
      s1.health-=rock.health;
      rocks.remove(rock);
      score+=25;
    }
    if(rock.reachedBottom()) {
      rocks.remove(rock);
    }
  }
  
  // add remove code
  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    laser.display();
    laser.fire();
    // Laser vs Rock Intersection
    for (int j = 0; j < rocks.size(); j++) {
      // What makes the collision happen?
      
    }
    if(laser.reachedTop()) {
      lasers.remove(laser);
    }
  }
  infoPanel();
  s1.display(mouseX, mouseY);
}

void mousePressed() {
  lasers.add(new Laser(color(255, 0, 0), s1.x, s1.y));
}

void keyPressed() {
  // use space bar for firing
}

void infoPanel() {
  fill(128,128);
  rectMode(CORNER);
  rect(0,height-50,width,50);
  fill(255,128);
  text("Health: " + s1.health, 20, height-20);
  text("Lives: " + s1.lives, 150, height-20);
  text("Level: ", 200, height-20);
  text("Score: " + score, 300, height-20);
}
