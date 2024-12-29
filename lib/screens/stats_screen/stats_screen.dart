import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gridfind/gridfind.dart';
import 'package:path_finding/node.dart' as dn;
import 'package:path_finding/screens/stats_screen/widgets/overall_stats.dart';
import 'package:path_finding/screens/stats_screen/widgets/task_stats.dart';

@RoutePage()
class StatsScreen extends StatefulWidget {
  const StatsScreen({
    super.key,
    required this.start,
    required this.target,
    required this.grid,
  });

  final Point start;
  final Point target;
  final List<List<dn.Node>> grid;

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
    final start = widget.start;
    final target = widget.target;

    return [
      (BFSState.init(start, target, grid), BFS(), 'BFS'), 
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
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
          // TODO: Since not every algorithm will spit out best path we must change this stats 
          return Column(
            children: [
              OverallStats(isDoable),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: count,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  final res = results[i];
                  return TaskStats(results[i].$1?.length, res.$2, res.$3);
                }
              )
            ],
          );
        },
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