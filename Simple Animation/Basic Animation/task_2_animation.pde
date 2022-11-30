// Program for processing sketch that has an aniamted element
// Declaring and initializing two integer variables at the top of the code.
int circleX = 320;
int circleY = 0;

void setup(){
  size(640, 480);
  smooth();
}

void draw() {
  background(255);
  
//Design in background 
  //code for face
  strokeWeight(2);
  stroke(0);
  fill(255, 255, 0);
  ellipse(320, 240, 200, 200);
  
  //code for smile
  noFill();
  strokeWeight(4);
  arc(320, 240, 140, 140, PI*0.2, PI*0.8);
  
  //code for eyes
  fill(0);
  ellipse(290, 230, 20, 40);
  ellipse(350, 230, 20, 40);
  
  //saving the image
  save("task_2_animation_1.tif");
  
//Animation running
  stroke(0);
  fill(255,0,0);
  
  //use another variables to specify the location of an ellipse.
  ellipse(circleX, circleY, 20, 20);

  // An assignment operation that increments the value of circleY by 1.
  circleY = circleY + 1;
  
  //saving animation
  save("task_2_animation_2.tif");
}
