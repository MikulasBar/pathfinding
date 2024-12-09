

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

abstract class PathFindingStrategy<S extends PathFindingState> {
  void step(S state);
  List<Position> solve(S state);
}

abstract class PathFindingState {
  List<Position> opened;
  List<Position> closed;
  Position start;
  Position target;
  List<List<Node>> grid;
  List<List<Position?>> parents;
  bool complete;

  PathFindingState({
    required this.opened,
    required this.closed,
    required this.start,
    required this.target,
    required this.grid,
    required this.parents,
    required this.complete,
  });

  int get width => grid.length;
  int get height => grid[0].length; 

  List<Position> findPath() {
    Position current = target;
    List<Position> path = [];
    while (current != start) {
      path.add(current);
      current = current.getFrom(parents)!; // IF NULL PATH CANNOT BE CREATED
    }

    return path;
  }

  bool isUntraversable(Position pos) {
    return pos.x < 0
      || pos.y < 0
      || pos.x >= grid.length
      || pos.y >= grid[0].length
      || pos.getFrom(grid) == Node.obstacle;
  }

  int distOverParentsFromStart(Position pos) {
    int dist = 0;
    Position current = pos;
    while (current != start) {
      current = current.getFrom(parents)!;
      dist++;
    }

    return dist;
  }
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
