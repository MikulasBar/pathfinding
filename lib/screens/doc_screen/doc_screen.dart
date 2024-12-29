import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:path_finding/app/router.gr.dart';

import 'widgets/algorithm_info.dart';
import 'widgets/legend_item.dart';

@RoutePage()
class DocScreen extends StatelessWidget {
  const DocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentation'),
        backgroundColor: Colors.red,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Legend',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            LegendItem(Colors.orange, 'Start'),
            LegendItem(Colors.blue, 'Target'),
            LegendItem(Colors.black, 'Obstacle'),
            LegendItem(Colors.green, 'Open Node'),
            LegendItem(Colors.red, 'Closed Node'),
            LegendItem(Colors.white, 'Idle Node'),
            SizedBox(height: 32.0),
            Text(
              'Pathfinding Algorithms',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            AlgorithmInfo(bfsTitle, bfsDesc),
            AlgorithmInfo(dfsTitle, dfsDesc),
            AlgorithmInfo(astarTitle, astarDesc),
            AlgorithmInfo(dijkstraTitle, dijkstraDesc),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.check),
        onPressed: () => context.router.push(const ConfigRoute()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


const bfsTitle = 'Breadth-First Search (BFS)';
const bfsDesc = '''
Prioritizes nodes closer to start.
Guarantees shortest path if all moves have equal cost. (In this example they have)
''';

const dfsTitle = 'Depth-First Search (DFS)';
const dfsDesc = '''
Explores as far as possible along one branch before backtracking.
No guarantee of shortest path.
''';

const astarTitle = 'A* Search';
const astarDesc = '''
Uses a priority queue; chooses node with smallest f = g + h.
Guarantees shortest path if heuristic (h) is admissible and consistent.
Admissible heuristic for 2D grid:
 - no diagonals: h = Manhattan distance.
 - diagonals: h = Chebyshev distance.
''';

const dijkstraTitle = 'Dijkstra\'s Algorithm';
const dijkstraDesc = '''
It's special case of A*.
Uses a priority queue; picks the node with the smallest cost so-far.
Guarantees shortest path for all nodes.
''';