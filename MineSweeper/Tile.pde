class Tile {
  private boolean revealed;
  private boolean bomb;
  private boolean marked;
  private boolean displayed;
  private int myColor;
  private double myX;
  private double myY;
  private int row;
  private int col;
  public Tile(int r, int c) {
    bomb = false;
    row = r;
    col = c;
    myX = width*c/ColTiles;
    myY = height*r/RowTiles;
  }
  public boolean getRevealed() {
    return revealed;
  }
  public void setRevealed(boolean r) {
    revealed = r;
    if (util.countNeighborBombs(row, col, RowTiles, ColTiles) == 0) {
      for (int i = 0; i < util.neighbors(row, col, RowTiles, ColTiles).size();i++) {
        if (util.neighbors(row, col, RowTiles, ColTiles).get(i).getRevealed() == false) {
          util.neighbors(row, col, RowTiles, ColTiles).get(i).setRevealed(true);
        }
      }
    }
  }
  public boolean getMarked() {
    return marked;
  }
  public void setMarked(boolean m) {
    marked = m;
  }
  public boolean getBomb() {
    return bomb;
  }
  public boolean setBomb(boolean b) {
    return bomb = b;
  }
  public boolean getDisplayed() {
    return displayed;
  }
  public void show() {
    displayed = marked || revealed;
    if (marked) {
      myColor = color(255, 0, 0);
      stroke(0);
      fill(myColor);
      rect((float) myX, (float) myY, width/ColTiles, height/RowTiles);
    } else if (revealed) {
      myColor = color(200);
      fill(myColor);
      rect((float) myX, (float) myY, width/ColTiles, height/RowTiles);
      if (util.countNeighborBombs(row, col, RowTiles, ColTiles) != 0) {
      textAlign(CENTER, CENTER);
      textSize(12);
      stroke(0);
      fill(0);
      text(util.countNeighborBombs(row, col, RowTiles, ColTiles), (float) (myX + width/(2*ColTiles)), (float) (myY + height/(2*RowTiles)));
      }
    }
  }
  public boolean mouseIn() {
    return (mouseX >= myX && mouseY >= myY && mouseX <= myX+width/ColTiles && mouseY <= myY + height/RowTiles);
  }
}
