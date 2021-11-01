//********** CloverPractice ***********
void setup() {
  size(400,400);
  noLoop();
}
void draw() {
  background(0);
  for(int i = 0; i < 100; i++)
  {
    Clover bob = new Clover();
    bob.show();
  }
}
void mousePressed() {
  redraw();
}
class Clover {
  int numLeaves, myX, myY;
  Clover() { //constructor
    numLeaves = 3+(int)(2*Math.random());
    myX = (int) (400*Math.random());
    myY = (int) (400*Math.random());
  }
  void show() {
     //I used some ugly math below
     //you can ignore it for now
    fill(0, 255, 0);
    stroke(0, 255, 0);
    float rot = random(PI*2);
    translate(myX, myY);
    rotate(rot);
    for (float i = 0; i < PI * 2; i+= PI*2/numLeaves) {
      rotate(i);
      translate(6, 0);
      ellipse(0, 0, 10, 10);
      translate(-6, 0);
      rotate(-i);
    }
    rotate(-rot);
    translate(-myX, -myY );
  }
}
