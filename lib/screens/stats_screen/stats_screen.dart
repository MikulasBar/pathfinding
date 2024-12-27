import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gridfind/gridfind.dart';
import 'package:path_finding/node.dart' as dn;

@RoutePage()
class StatsScreen extends StatefulWidget {
  StatsScreen({
    required super.key,
    required this.start,
    required this.target,
    required this.grid,
  });

  Point start;
  Point target;
  List<List<dn.Node>> grid;

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  late List<Future<(List<Point>?, Duration)>> tasks;

  @override
  void initState() {
    super.initState();

    final start = widget.start;
    final target = widget.target;
    final grid = setupGrid(widget.grid);

    tasks = initStates(start, target, grid)
      .map((s) => solveStateAsync(s.$1, s.$2))
      .toList();
  }

  Future<(List<Point>?, Duration)> solveStateAsync(
    PathFindingState state,
    PathFindingStrategy alg,
  ) async {
    return measure(() => alg.solve(state));
  }

  List<(PathFindingState, PathFindingStrategy)> initStates(
    Point start,
    Point target,
    List<List<Node>> grid
  ) {
    return [
      (BFSState.init(start, target, grid), BFS()), 
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: const Column(
        children: [
          // TODO
        ],
      ),
    );
  }
}


(T, Duration) measure<T>(T Function() cb) {
  final start = DateTime.now();
  final res = cb();
  final end = DateTime.now();
  final dur = end.difference(start);

  return (res, dur);
}

List<List<Node>> setupGrid(List<List<dn.Node>> grid) {
  final newGrid = grid.map((l) => l.map((n) {
    return switch (n) {
      dn.Node.obstacle => Node.obstacle,
      _ => Node.idle,
    };
  }).toList())
  .toList();

  return newGrid;
}