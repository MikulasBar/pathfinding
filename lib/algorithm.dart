

import 'package:flutter/material.dart';
import 'package:path_finding/position.dart';

enum Algorithm {
  // ignore: constant_identifier_names
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
  idle,
  obstacle,
  start,
  target,
  opened,
  closed;

  Color toColor() {
    return switch (this) {
      idle => Colors.white,
      obstacle => Colors.black,
      start => Colors.orange,
      target => Colors.blue[600]!,
      opened => Colors.green,
      closed => Colors.red,
    };
  }
}
