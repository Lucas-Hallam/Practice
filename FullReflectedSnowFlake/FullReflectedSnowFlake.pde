int flakeSize = 3;
ArrayList <Flake> flakeList = new ArrayList <Flake>();
ArrayList <Flake> stoppedFlakes = new ArrayList <Flake>();
int numArms = 6;
int numFlakes = 600;
void setup() {
  size(500, 500);
  for (int i = 0; i < numFlakes; i++) {
    flakeList.add(new Flake(width/2, 0));
  }
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);
  for (Flake f : flakeList) {
    while (f.reached == false) {
      f.move();
    }
    stoppedFlakes.add(f);
  }
  translate(250, 250);
  for (int i = 0; i < numArms; i++) {
    for (Flake f : flakeList) {
      f.show();
    }
    rotate(2*PI/numArms);
  }
  for (int j = 0; j < numArms; j++) {
    for (Flake f : flakeList) {
      f.reflectShow();
    }
    rotate(2*PI/numArms);
  }
}
