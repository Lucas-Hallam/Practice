class Widget {
  private double dNum;
  private String sWord;
  public Widget() {
    dNum = 2.5;
    sWord = "Hello";
  }
  public double doubleSum() {
    double dTemp = dNum + sWord.length();
    return dTemp;
  }
  public double getNum() {
    return dNum;
  }
  public void setNum(double num) {
    dNum = num;
  }
  public String getString() {
    return sWord;
  }
  public void setString(String s) {
    sWord = s;
  }
}
