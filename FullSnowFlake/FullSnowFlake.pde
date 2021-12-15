int flakeSize = 3;
ArrayList <Flake> flakeList = new ArrayList <Flake>();
ArrayList <Flake> stoppedFlakes = new ArrayList <Flake>();
int numArms = 6;
int numFlakes = 600;
int i;
void setup() {
  size(500, 500);
  for (int i = 0; i < numFlakes; i++) {
    flakeList.add(new Flake(width/2, 0));
  }
  i = 0;
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
  //if (flakeList.get(i).reached == false) {
    //flakeList.get(i).move(stoppedFlakes);
  //} else {
    //if (i < numFlakes - 1) {
      //stoppedFlakes.add(flakeList.get(i));
      //i++;
    //}
  //}
  translate(250,250);
  for (int i = 0;i < numArms;i++) {
    for (Flake f : flakeList) {
    f.show();
    }
    rotate(2*PI/numArms);
}
}
