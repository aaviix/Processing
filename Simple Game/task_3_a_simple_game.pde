Catcher catcher;
Drop [] drops;
int numDrops;

Timer timer;
int timeInterval;
int activeDrops;

int score;
String s;

void setup(){
  size(640, 480);
  catcher = new Catcher(16);
  
  numDrops = 100;
  drops = new Drop[numDrops];
  for(int i = 0; i < numDrops; i++){
    drops[i] = new Drop();
  }
  
  timeInterval = 500;
  activeDrops = 0;
  timer = new Timer(timeInterval);
  timer.start();
  
  score = 0;
  s = "Score: " + score;
}

void draw(){
  clearBackground();
  catcher.update();
  catcher.display();
  
  //timer
  if (timer.complete() == true){
    if (activeDrops < numDrops){
      activeDrops++;
    }
    timer.start();
  }
  
  //drop
  for(int i = 0; i < activeDrops; i++){
    drops[i].update();
    drops[i].display();
    //check collisions
    if(intersect(catcher, drops[i]) == true){
      drops[i].caught();
      score++;
    }
  }
  
  //update UI
  textSize(15);
  textAlign(LEFT);
  fill(255,0,0);
  s = "Score: "+ score;
  text(s, 10, 20);
}

void mousePressed(){
  if (score >= numDrops){
    reset();
  }
}

void reset(){
  score = 0;
  activeDrops = 0;
  timeInterval = 1000;
  for(int i = 0; i < numDrops; i++){
    reset();
  }
}

void clearBackground() {
  fill(255);
  rect(0, 0, width, height);
}

boolean intersect(Catcher a, Drop b) {
  float distance = dist(a.x, a.y, b.x, b.y);
  if (distance < a.r+b.r) {
    return true;
  } else{
    return false;
  }
}
