import 'dart:collection';
import 'package:path_finding/gridfind/node.dart';
import 'package:path_finding/gridfind/point.dart';
import 'package:path_finding/gridfind/state.dart';
import 'package:path_finding/gridfind/status.dart';
import 'package:path_finding/gridfind/strategy.dart';

const maxIntVal = 2 ^ 63 - 1;

class BFS extends PathFindingStrategy<BFSState> {
  @override
  void searchStep(BFSState state) {
    if (state.open.isEmpty) {
      state.status = Status.failure;
      return;
    }

    Point point = state.findLowestCost();
    point.set(state.grid, Node.closed);
    state.open.remove(point);

    if (point == state.target) {
      state.status = Status.success;
      return;
    }

    for (var (i, j) in [(1, 0), (-1, 0), (0, 1), (0, -1)]) {
      Point newPos = Point(point.x + i, point.y + j);
      Node newNode = newPos.get(state.grid);
      if (state.isUntraversable(newPos) || newNode == Node.closed) {
        continue;
      }

      final newPosParent = newPos.get(state.parents);
      final parentCost = newPosParent?.get(state.cost);
      final pointCost = point.get(state.cost);

      if (newNode != Node.open || parentCost! > pointCost) {
        newPos.set(state.parents, point);

        int parentCost = point.get(state.cost);
        newPos.set(state.cost, parentCost + 1);

        newPos.set(state.grid, Node.open);
        state.open.add(newPos);
      }
    }
  }
}

class BFSState extends PathFindingState {
  List<List<int>> cost;

  BFSState({
    required super.open,
    required super.start,
    required super.target,
    required super.grid,
    required super.parents,
    required super.status,
    required this.cost,
  });

  BFSState init(Point start, Point target, List<List<Node>> grid) {
    var parents = List.generate(width, (_) => List.generate(height, (_) => null));
    var cost = List.generate(width, (_) => List.generate(height, (_) => maxIntVal));

    var state = BFSState(
      open: HashSet.from([start]),
      start: start,
      target: target,
      grid: grid,
      parents: parents,
      status: Status.search,
      cost: cost,
    );

    start.set(state.cost, 0);
    start.set(state.grid, Node.open);

    return state;
  }

  Point findLowestCost() {
    final init = (maxIntVal, Point(-1, -1));
    final (min, node) = open.fold(init, (acc, point) {
      final newCost = point.get(cost);
      if (acc.$1 > newCost) {
        return (newCost, point);
      }
      return acc;
    });

    return node;
  }

}
