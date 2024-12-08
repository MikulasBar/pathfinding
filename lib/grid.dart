import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:path_finding/algorithm.dart';

class Grid extends StatelessWidget {
  static const nodeSize = 20.0;
  List<List<Node>> nodes;
  
  Grid({
    super.key,
    required this.nodes,
  });
  
  List<Container> getBlocks() {
    return nodes.expand((l) => l).map((n) {
      return Container(
        width: nodeSize,
        height: nodeSize,
        color: n.toColor(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final double gridWidth = nodes.length * nodeSize;
    final double gridHeight = nodes[0].length * nodeSize;

    return SizedBox(
      width: gridWidth,
      height: gridHeight,
      child: Listener(
        onPointerSignal: (event) {},
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: nodes.length,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          children: getBlocks(),
        ),
      ),
    );
  }
}