public class Wiggler
{
  private int myX, myY;
  public Wiggler() {
    myX = myY = 150;
  }
  public int getX() {
    return myX;
  }
  public int getY() {
    return myY;
  }
  public void setX(int x) {
    myX = x;
  }
  public void setY(int y) {
    myY = y;
  }
  public void wiggle()
  {
    myX+=(int)(Math.random()*5)-2;
  }
}
