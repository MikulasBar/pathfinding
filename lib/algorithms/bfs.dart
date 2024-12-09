import 'package:path_finding/algorithm.dart';
import 'package:path_finding/position.dart';

const maxIntVal = 2 ^ 63 - 1;

class BFS extends PathFindingStrategy<BFSState> {
  @override
  List<Position> solve(BFSState state) {
    // TODO: implement solve
    throw UnimplementedError();
  }

  @override
  void step(BFSState state) {
    Position pos = state.findClosestOpenedToStart();
    pos.setIn(state.grid, Node.closed);

    if (pos.taxicabDist(state.target) == 0) {
      state.complete = true;
    }

    for (var i = -1; i < 2; i++) {
      for (var j = -1; j < 2; j++) {
        Position newPos = Position(pos.x + i, pos.y + j);
        Node newNode = newPos.getFrom(state.grid);
        if (state.isUntraversable(newPos) || newNode == Node.closed) {
          continue;
        }

        int parentToStart =  state.distOverParentsFromStart(newPos.getFrom(state.parents)!);
        int posToStart = state.distOverParentsFromStart(pos);

        if (newNode != Node.opened || parentToStart > posToStart) {
          newPos.setIn(state.parents, pos);
          int distToStart = newPos.taxicabDist(state.start);
          newPos.setIn(state.cost, distToStart);
          newPos.setIn(state.grid, Node.opened);
        }
      }
    }
  }
}

class BFSState extends PathFindingState {
  List<List<int?>> cost;

  BFSState({
    required super.opened,
    required super.closed,
    required super.start,
    required super.target,
    required super.grid,
    required super.parents,
    required super.complete,
    required this.cost,
  });

  BFSState create(Position start, Position target, List<List<Node>> grid) {
    var parents = List.generate(width, (_) => List.generate(height, (_) => null));
    var cost = List.generate(width, (_) => List.generate(height, (_) => -1));
    return BFSState(
      opened: [],
      closed: [],
      start: start,
      target: target,
      grid: grid,
      parents: parents,
      complete: false,
      cost: cost,
    );
  }

  Position findClosestOpenedToStart() {
    Position node = Position(-1, -1);
    int min = maxIntVal;
    for (var i = 0; i < width; i++) {
      for (var j = 0; j < height; j++) {
        Position pos = Position(i, j);
        int dist = pos.taxicabDist(start);
        if (pos.getFrom(grid) == Node.opened && dist < min) {
          min = dist;
          node = pos;
        }
      }
    }

    return node;
  }

  
}
