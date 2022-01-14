Widget Bob = new Widget();
Widget Sue = new Widget();
void setup() {
  Bob.setNum(5.5);
  Bob.setString("Hi");
  Sue.setNum(Bob.getNum());
  Sue.setString(Bob.getString());
}
void draw() {
}
