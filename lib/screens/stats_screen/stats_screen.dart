import 'package:flutter/material.dart';
import 'package:gridfind/gridfind.dart';
import 'package:path_finding/app/router.gr.dart';
import 'package:path_finding/node.dart' as dn;
import 'package:path_finding/screens/stats_screen/widgets/overall_stats.dart';
import 'package:path_finding/screens/stats_screen/widgets/task_stats.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class StatsScreen extends StatefulWidget {
  final Point start;
  final Point target;
  final List<List<dn.Node>> grid;
  final bool allowDiagonals;

  const StatsScreen({
    super.key,
    required this.start,
    required this.target,
    required this.grid,
    required this.allowDiagonals,
  });

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  late final List<List<Node>> grid;
  late Future<List<(List<Point>?, Duration, String)>> tasks;

  @override
  void initState() {
    super.initState();

    grid = setupGrid(widget.grid);
    tasks = initAsyncTasks();
  }

  Future<List<(List<Point>?, Duration, String)>> initAsyncTasks() {
    final tasks = initStates()
      .map((s) => solveStateAsync(s.$1, s.$2, s.$3))
      .toList();

    return Future.wait(tasks);
  }

  Future<(List<Point>?, Duration, String)> solveStateAsync(
    PathFindingState state,
    PathFindingStrategy alg,
    String name,
  ) async {
    final res = measure(() => alg.solve(state));
    return (res.$1, res.$2, name);
  }

  List<(PathFindingState, PathFindingStrategy, String)> initStates() {
    return [0]
      .map((x) => initOnlyState(x))
      .toList();
  }

  (PathFindingState, PathFindingStrategy, String) initOnlyState(int index) {
    final start = widget.start;
    final target = widget.target;
    final diag = widget.allowDiagonals;
    
    return switch(index) {
      0 => (BFSState.init(start, target, cloneGrid(grid), diag), BFS(), 'BFS'),
      _ => throw Exception(),
    };
  }

  VoidCallback prepareCallback(
    BuildContext context,
    PathFindingState state,
    PathFindingStrategy alg,
    String name,
  ) {
    return () => context.router.push(
      AnimationRoute(state: state, alg: alg, name: name)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: FutureBuilder(
        future: tasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Snaphost has no data'));
          }
          final results = snapshot.data!;
          final count = results.length;
          final isDoable = results[0].$1 != null;
          return Column(
            children: [
              OverallStats(isDoable),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: count,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  final (path, dur, name) = results[i];
                  final (state, alg, _) = initOnlyState(i);
                  final cb = prepareCallback(context, state, alg, name);
                  return TaskStats(path?.length, dur, name, cb);
                }
              )
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.popUntilRoot();
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.home),
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

List<List<Node>> cloneGrid(List<List<Node>> grid) {
  return grid.map((row) => List<Node>.from(row)).toList();
}

List<List<Node>> reverseCoords(List<List<Node>> grid) {
  int numRows = grid.length;
  int numCols = grid[0].length;

  List<List<Node>> reversedGrid = List.generate(numRows, (i) => List<Node>.filled(numCols, Node.idle));

  for (int i = 0; i < numRows; i++) {
    for (int j = 0; j < numCols; j++) {
      reversedGrid[i][j] = grid[numRows - 1 - i][numCols - 1 - j];
    }
  }

  return reversedGrid;
}

Point revPoint(Point point) {
  return Point(point.y, point.x);
}