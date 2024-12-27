
import 'package:path_finding/gridfind/state.dart';
import 'package:path_finding/gridfind/status.dart';
import 'package:path_finding/gridfind/point.dart';

abstract class PathFindingStrategy<S extends PathFindingState> {
  void searchStep(S state);

  List<Point>? solve(S state) {
    var status = state.status;
    while (status == Status.search) {
      searchStep(state);
      status = state.status;
    }

    return switch (status) {
      Status.success => constructPath(state),
      Status.failure => null,
      _ => throw Exception("Unreachable branch"),
    };
  }

  List<Point> constructPath(S state) {
    List<Point> path = [];
    var current = state.target;

    while (current != state.start) {
      path.add(current);
      current = current.get(state.parents)!;
    }

    path.add(state.start);

    return path;
  }
}