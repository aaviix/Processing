
int rad = 20;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


ArrayList <Borg> borgs; // array for swarm

void setup() {
  size(640, 480);
  //
  borgs = new ArrayList();
  for (int i = 0; i<150; i++) {
    borgs.add(new Borg(random(width), random(height)));
  }
  
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2; 
}

void checkCollisions() {
  // Collision between swarm particles
  ArrayList <Borg> toDie = new ArrayList();
  ArrayList <Borg> toCreate = new ArrayList();
  for (int a = 0; a < borgs.size(); a++) {
    Borg p = borgs.get(a);
    for (int b = a+1; b < borgs.size(); b++) {
      Borg q = borgs.get(b);
      PVector pq = new PVector(q.x-p.x, q.y-p.y);
      if (pq.mag()<50) {
        line(p.x, p.y, q.x, q.y);

        float sim = p.vx * q.vx + p.vy * q.vy;

        if (sim>1) {
          toCreate.add(new Borg((p.x+q.y)/2.0, (p.y+q.y)/2.0));
        }
        if (sim<-0.5) {
          toDie.add(p);
        }
      }
    }
  }
  borgs.removeAll(toDie);
  borgs.addAll(toCreate);
}


void draw() {
  // Swarm Drawing
  fill(borgs.size(), 200, 200, 1);
  rect(0, 0, width, height);
  
  saveFrame("task_4_swarm_1.tif");

  for (Borg b : borgs) {
    b.update();
  }
  checkCollisions();
  for (Borg b : borgs) {
    b.draw();
  }
  println(borgs.size());
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
  saveFrame("task_4_swarm_2.tif");
}
