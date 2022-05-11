public class MyUtil {
  public boolean isValidOnXbyY(int row, int col, int R, int C) {
    if (row<R && row >= 0 && col >= 0 && col < C) {
      return true;
    } else {
      return false;
    }
  }
  public int countMarked() {
    int marked = 0;
    for (Tile [] tR : tiles) {
      for (Tile t : tR) {
        if (t.getMarked() == true) {
          marked++;
        }
      }
    }
    return marked;
  }
  public ArrayList <Tile> neighbors(int row, int col, int R, int C) {
    ArrayList <Tile> Neighbors = new ArrayList <Tile>();
    for (int r = row - 1; r < row + 2; r++) {
      for (int c = col - 1; c < col + 2; c++) {
        if (isValidOnXbyY(r, c, R, C) == false) {
        } else {
          Neighbors.add(tiles[r][c]);
        }
      }
    }
    return Neighbors;
  }
  public int countNeighborBombs(int row, int col, int R, int C) {
    int trues = 0;
    for (int r = row - 1; r < row + 2; r++) {
      for (int c = col - 1; c < col + 2; c++) {
        if (isValidOnXbyY(r, c, R, C) == false) {
        } else {
          if (tiles[r][c].getBomb() == true && (r != row || c != col)) {
            trues++;
          }
        }
      }
    }
    return trues;
  }
  public boolean NeighborRevealed(int row, int col, int R, int C) {
    boolean neighborRevealed = false;
    for (int r = row - 1; r < row + 2; r++) {
      for (int c = col - 1; c < col + 2; c++) {
        if (isValidOnXbyY(r, c, R, C) == false) {
        } else {
          if (tiles[r][c].getRevealed() == true && (r != row || c != col)) {
            neighborRevealed = true;
            break;
          }
        }
      }
    }
    return neighborRevealed;
  }
}
