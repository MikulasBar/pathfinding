

enum Algorithm {
  BFS;

  @override
  String toString() {
    switch (this) {
      case Algorithm.BFS:
        return 'BFS';
      default:
        return 'DEFAULT';
    }
  }

  static List<Algorithm> get variants => [
    Algorithm.BFS,
  ]; 
}