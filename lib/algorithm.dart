

import 'package:flutter/material.dart';

enum Algorithm {
  BFS;

  @override
  String toString() {
    return switch (this) {
      BFS => 'BFS',
    };
  }

  static List<Algorithm> get variants => [
    Algorithm.BFS,
  ];
}

abstract class PathFindingStrategy {
  PathFindingState step(PathFindingState state);
  List<Position> solve(PathFindingState state);
}

abstract class PathFindingState {
  List<Position> opened;
  List<Position> closed;
  Position start;
  Position target;
  List<List<Node>> grid;
  List<List<Position>> parents;

  PathFindingState({
    required this.opened,
    required this.closed,
    required this.start,
    required this.target,
    required this.grid,
    required this.parents,
  });
}

enum Node {
  Idle,
  Obstacle,
  Start,
  Target,
  Opened,
  Closed;

  Color toColor() {
    return switch (this) {
      Idle => Colors.white,
      Obstacle => Colors.black,
      Start => Colors.orange,
      Target => Colors.blue[600]!,
      Opened => Colors.green,
      Closed => Colors.red,
    };
  }
}

class Position {
  int x;
  int y;

  Position({
    required this.x,
    required this.y,
  });
}

