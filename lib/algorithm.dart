
enum Algorithm {
  // ignore: constant_identifier_names
  bfs;

  @override
  String toString() {
    return switch (this) {
      bfs => 'BFS',
    };
  }
}


