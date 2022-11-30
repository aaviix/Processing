void setup(){
  size(640, 480);
}

void draw(){
  stroke(0, 0, 0);
  fill(250, 160, 50);
  rect(80, 150, 90, 250);
  fill(54, 247, 225);
  circle(125, 100, 80);
  fill(0,0,0);
  circle(125,90,20);
  fill(255,0,0);
  triangle(60, 75, 95, 40, 110, 100);
  save("02_draw_an_image.tif");
}
