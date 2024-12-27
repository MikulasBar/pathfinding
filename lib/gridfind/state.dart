
import 'dart:collection';

import 'package:path_finding/gridfind/node.dart';
import 'package:path_finding/gridfind/point.dart';
import 'package:path_finding/gridfind/status.dart';

abstract class PathFindingState {
  HashSet<Point> open;
  Point start;
  Point target;
  List<List<Node>> grid;
  List<List<Point?>> parents;
  Status status;

  PathFindingState({
    required this.open,
    required this.start,
    required this.target,
    required this.grid,
    required this.parents,
    required this.status,
  });

  int get width => grid.length;
  int get height => grid[0].length;

  bool isUntraversable(Point pos) {
    return pos.x < 0
      || pos.y < 0
      || pos.x >= grid.length
      || pos.y >= grid[0].length
      || pos.get(grid) == Node.obstacle;
  }

  int distOverParentsFromStart(Point pos) {
    int dist = 0;
    Point current = pos;
    while (current != start) {
      current = current.get(parents)!;
      dist++;
    }

    return dist;
  }
}
