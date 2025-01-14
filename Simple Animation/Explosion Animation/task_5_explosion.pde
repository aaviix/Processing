//Processing sketch of a Simple Explosion

ArrayList plist = new ArrayList();
int MAX = 50;

void setup() {
  size(640,480);
  background(0);
}

void draw() {
  background(50);
  if(mousePressed && mouseButton == RIGHT) {
    background(50);
    boolean clearall = true;
    while(plist.size() > 0) {
      for(int i = 0; i < plist.size(); i++) {
        plist.remove(i);
      }
    }
  }

  for(int i = 0; i < plist.size(); i++) {
    Particle p = (Particle) plist.get(i); 
    //makes p a particle equivalent to ith particle in ArrayList
    p.run();
    p.update();
    p.gravity();
  }
  text("Click to cause the EXPLOSION on the screen",210, 30);
  textSize(12);
  save("task_5_explosion.tif"); // save the image after explosion
}

void mousePressed() {
  for (int i = 0; i < MAX; i ++) {
    plist.add(new Particle(mouseX,mouseY)); // fill ArrayList with particles

    if(plist.size() > 5*MAX) {
      plist.remove(0);
    }
  }
}

//--------------------------------------------------------------

class Particle {
  float r = 5;
  PVector pos,speed,grav; 
  ArrayList tail;
  float splash = 5;
  int margin = 2;
  int taillength = 25;

  Particle(float tempx, float tempy) {
    float startx = tempx + random(-splash,splash);
    float starty = tempy + random(-splash,splash);
    startx = constrain(startx,0,width);
    starty = constrain(starty,0,height);
    float xspeed = random(-3,3);
    float yspeed = random(-3,3);

    pos = new PVector(startx,starty);
    speed = new PVector(xspeed,yspeed);
    grav = new PVector(0,0.02);
    
    tail = new ArrayList();
  }

  void run() {
    pos.add(speed);

    tail.add(new PVector(pos.x,pos.y,0));
    if(tail.size() > taillength) {
      tail.remove(0);
    }

    float damping = random(-0.5,-0.6);
    if(pos.x > width - margin || pos.x < margin) {
      speed.x *= damping;
    }
    if(pos.y > height -margin) {
      speed.y *= damping;
    }
  }

  void gravity() {
    speed.add(grav);
  }

  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(6*i + 50);
      ellipse(tempv.x,tempv.y,r,r);
    }
  }
}
