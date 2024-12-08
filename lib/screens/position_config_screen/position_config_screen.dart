import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:path_finding/algorithm.dart';
import 'package:path_finding/app/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:path_finding/app/router.gr.dart';
import 'package:path_finding/screens/position_config_screen/widgets/changeable_grid.dart';
import 'package:path_finding/position.dart';
import 'package:path_finding/screens/position_config_screen/widgets/stage_buttons.dart';

enum PickingStage {
  start,
  target,
  obstacles;
}

@RoutePage()
class PositionConfigScreen extends StatefulWidget {
  final int width;
  final int height;

  const PositionConfigScreen({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  State<PositionConfigScreen> createState() => _PositionConfigScreenState();
}

class _PositionConfigScreenState extends State<PositionConfigScreen> {
  late List<List<Node>> nodes;
  Position? start;
  Position? target;
  PickingStage stage = PickingStage.start;
  List<bool> isSelected = [true, false, false];

  @override
  void initState() {
    super.initState();
    nodes = List.generate(
        widget.width, (i) => List.generate(widget.height, (j) => Node.idle));
  }

  void switchStage(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
      stage = PickingStage.values[index];
    });
  }

  void handleNodeClick(Position pos) {
    setState(() {
      switch (stage) {
        case PickingStage.start:
          setStart(pos);
          break;
        case PickingStage.target:
          setTarget(pos);
          break;
        case PickingStage.obstacles:
          setObstacle(pos);
          break;
        default:
          print("Unreachable");
      }
    });
  }

  void setStart(Position pos) {
    start?.setIn(nodes, Node.idle);
    start = pos;
    start!.setIn(nodes, Node.start);
  }

  void setTarget(Position pos) {
    target?.setIn(nodes, Node.idle);
    target = pos;
    target!.setIn(nodes, Node.target);
  }

  void setObstacle(Position pos) {
    switch (pos.getFrom(nodes)) {
      case Node.obstacle:
        pos.setIn(nodes, Node.idle);
        return;
      case Node.start:
        start = null;
        break;
      case Node.target:
        target = null;
        break;
      default:
        print("Unreachable");
    }

    pos.setIn(nodes, Node.obstacle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor: Colors.red),
      body: Stack(
        children: [
          Center(
            child: ChangeableGrid(nodes: nodes, onNodeClick: handleNodeClick)
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: StageButtons(isSelected: isSelected, switchStage: switchStage)
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () => context.router.push(const StatsRoute()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
