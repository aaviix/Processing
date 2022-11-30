class Drop {
  float x;
  float y;
  float r;
  float speedY;
  color c;
  boolean active;
  
  Drop() {
    r = 8;
    x = random(width);
    y = -r * 4;
    speedY = random(1,5);
    c = color(51, 100, random(100, 255));
    active = true;
  }
  
  void update() {
    //position
    y += speedY;
    //check bound
    if (y > height + r){
      y = -r;
    }
  }
  
  void display(){
    noStroke();
    fill(c);
    ellipse(x, y, r*2, r*2);
  }
  
  void caught(){
    speedY = 0;
    x = -1000;
    active = false;
  }
  void reset(){
    x = random(100, width-100);
    y = 0;
    speedY = random(3, 7);
    c = color(51, 100, random(100, 255));
    active = true;
  }
}
