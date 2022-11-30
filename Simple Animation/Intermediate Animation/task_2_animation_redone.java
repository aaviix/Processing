// Program for processing sketch that has an aniamted element
// Small Hills
int x1 = -200;
int x2 = 200;
int x3 = 600;

// Cloud
int x4 = 400;

// Big Hills
int x5 = -200;
int x6 = 0;
int x7 = 200;
int x8 = 400;
int x9 = 600;
int x10 = 800;

void setup() {
  size (640, 480   ); 
  noStroke();
}

void draw() {
  background(0, 0, 255); //sky
  
  fill(255, 255, 255); //cloud
  ellipse(x4, 150, 100, 100);
  ellipse(x4, 200, 100, 100);
  ellipse(x4-50, 200, 100, 100);
  ellipse(x4+50, 200, 100, 100);
  
  fill(0, 255, 0); // back hills
  ellipse(x1, 400, 400, 400);
  ellipse(x2, 400, 400, 400);
  ellipse(x3, 400, 400, 400);
  
  fill(2, 99, 12); // fore hills
  ellipse(x4, 400, 200, 200);
  ellipse(x5, 400, 200, 200);
  ellipse(x6, 400, 200, 200);
  ellipse(x7, 400, 200, 200);
  ellipse(x8, 400, 200, 200);
  ellipse(x9, 400, 200, 200);
  ellipse(x10, 400, 200, 200);
  
  fill(255, 255, 0); // ground
  rect(0, 400, 800, 200);
  
  rabbit();
  
  //move cloud
  x4 = x4 + 1;
  if (x4 == 1000){
    x4 = -200;
  }
  
  //move small hills
  x1 = x1 + 2;
  x2 = x2 + 2;
  x3 = x3 + 2;
  
  if (x1 >= 1000) {
    x1 = -200;
  }
  if (x2 >= 1000){
    x2 = -200;
  }
  if (x3 >= 1000){
    x3 = -200;
  }
  
  //move big hills
  x4 = x4 + 4;
  x5 = x5 + 4;
  x6 = x6 + 4;
  x7 = x7 + 4;
  x8 = x8 + 4;
  x9 = x9 + 4;
  x10 = x10 + 4;
  
  if (x4 >= 1000) {
    x4 = -200;
  }
  if (x5 >= 1000){
    x5 = -200;
  }
  if (x6 >= 1000){
    x6 = -200;
  }
  if (x7 >= 1000) {
    x7 = -200;
  }
  if (x8 >= 1000){
    x8 = -200;
  }
  if (x9 >= 1000){
    x9 = -200;
  }
  if (x10 >= 1000) {
    x10 = -200;
  }
  
  //saving animation
  save("task_2_animation_2.tif");
}

//-----------------------------------------

void rabbit() {
  noStroke();
  fill(255);
  ellipse (100, 100, 50, 100);
  ellipse (200, 100, 50, 100);
  ellipse (150, 200, 200, 200);
  fill(0);
  ellipse (100, 200, 30, 30);
  ellipse (200, 200, 30, 30);
  ellipse (100, 200, 30, 30);

  //saving the image
  save("task_2_animation_1.tif");
}
