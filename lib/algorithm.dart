
import 'package:gridfind/gridfind.dart';

// TODO: decide if this is neccessary
enum Algorithm {
  // ignore: constant_identifier_names
  bfs;

  @override
  String toString() {
    return switch (this) {
      bfs => 'BFS',
    };
  }

  PathFindingStrategy get strategy {
    return switch (this) {
      bfs => BFS(),
    };
  }

  PathFindingState initState(Point start, Point target, List<List<Node>> grid) {
    return switch (this) {
      bfs => BFSState.init(start, target, grid),
    };
  }

  List<Point>? solve(Point start, Point target, List<List<Node>> grid) {
    var state = initState(start, target, grid);
    return strategy.solve(state);
  }
}


