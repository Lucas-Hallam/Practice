class Flake {
  float x, y, s;
  boolean stopped, reached, touched;
  Flake(float x_, float y_) {
    x = x_;
    y = y_;
    s = flakeSize;
    stopped = false;
  }
  void move() {
    // random movement
    x -= 1;
    y += (int)(5*Math.random())-2;
    if (x < 0) {
      stopped = true;
    }
    for (Flake f : stoppedFlakes) {
       if (dist(f.x,f.y,x,y) <= flakeSize) {
         touched = true;
       }
     }
    reached = touched || stopped;
  }
  void show() {
    ellipse(x, y, s, s);
  }  
}
