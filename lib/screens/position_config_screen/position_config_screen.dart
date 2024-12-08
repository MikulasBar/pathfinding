import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:path_finding/algorithm.dart';
import 'package:path_finding/grid.dart';

@RoutePage()
class PositionConfigScreen extends StatefulWidget {
  final int width;
  final int height;
  final Algorithm alg;

  const PositionConfigScreen({
    super.key,
    required this.width,
    required this.height,
    required this.alg,
  });

  @override
  State<PositionConfigScreen> createState() => _PositionConfigScreenState();
}

class _PositionConfigScreenState extends State<PositionConfigScreen> {
  late List<List<Node>> nodes;
  Position? start;
  Position? target;


  @override
  void initState() {
    super.initState();
    nodes = List.filled(widget.width, List.filled(widget.height, Node.Idle));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor: Colors.red),
      body: Center(
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(70),
          clipBehavior: Clip.none,
          child: Grid(nodes: nodes)
        ),
      ),
    );
  }
}