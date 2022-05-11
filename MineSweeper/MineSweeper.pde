public static final int RowTiles = 20;
public static final int ColTiles = 20;
public static final int numBombs = 50;
public boolean on = true;
public boolean won = false;
public Tile [][] tiles = new Tile [RowTiles][ColTiles];
public MyUtil util = new MyUtil();
public void setup() {
  size(750, 750);
  background(255);
  for (int r = 0; r < tiles.length; r++) {
    for (int c = 0; c < tiles[r].length; c++) {
      tiles[r][c] = new Tile(r, c);
    }
  }
  ArrayList <Integer> bombNumbers = new ArrayList <Integer>();
  int num;
  boolean same;
  for (int i = 0; i < numBombs; i++) {
    num = (int) (Math.random() * RowTiles * ColTiles);
    same = false;
    for (int j = 0; j < bombNumbers.size(); j++) {
      if (num == bombNumbers.get(j)) {
        same = true;
      }
    }
    if (same) {
      i--;
    } else {
      bombNumbers.add(num);
    }
  }
  for (int i = 0; i < bombNumbers.size(); i++) {
    tiles[bombNumbers.get(i)%RowTiles][bombNumbers.get(i)/RowTiles].setBomb(true);
  }
}
public void draw() {
  if (on) {
    background(255);
    for (int r = 0; r < tiles.length; r++) {
      for (int c = 0; c < tiles[r].length; c++) {
        tiles[r][c].show();
      }
    }
  }
  won = true;
  for (Tile [] tR : tiles) {
    for (Tile t : tR) {

      if (t.getDisplayed() == false) {
        won = false;
      }
    }
  }
  if (won) {
    textAlign(CENTER, CENTER);
    textSize(100);
    stroke(0);
    fill(0);
    text("YOU WON!", 375, 375);
  }
}
public void mousePressed() {
  if (on) {
    if (mouseButton == LEFT) {
      for (int r = 0; r < tiles.length; r++) {
        for (int c = 0; c < tiles[r].length; c++) {
          if (tiles[r][c].mouseIn()) {
            if (tiles[r][c].getMarked() == false) {
              tiles[r][c].setRevealed(true);
              if (tiles[r][c].getBomb()) {
                textAlign(CENTER, CENTER);
                textSize(100);
                stroke(0);
                fill(0);
                text("GAME OVER", 375, 375);
                on = false;
              }
              break;
            }
          }
        }
      }
    } else if (mouseButton == RIGHT) {
      for (int r = 0; r < tiles.length; r++) {
        for (int c = 0; c < tiles[r].length; c++) {
          if (tiles[r][c].mouseIn()) {
            if (tiles[r][c].getMarked() == false) {
              if (util.countMarked() == numBombs) {
                textAlign(CENTER, CENTER);
                textSize(70);
                stroke(255, 0, 0);
                fill(255, 0, 0);
                text("Maximum Areas Marked", 375, 375);
                break;
              } else {
                tiles[r][c].setMarked(true);
                break;
              }
            } else {
              tiles[r][c].setMarked(false);
              break;
            }
          }
        }
      }
    }
  }
}
