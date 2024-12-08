
class Position {
  int x;
  int y;

  Position(this.x, this.y);

  T getFrom<T>(List<List<T>> grid) {
    return grid[x][y];
  }

  void setIn<T>(List<List<T>> grid, T val) {
    grid[x][y] = val;
  }
}

