

import 'package:flutter/material.dart';
import 'package:gridfind/node.dart';
import 'package:gridfind/point.dart';
import 'package:path_finding/node.dart' as dn;

class NodeGrid extends StatelessWidget {
  static const double nodeSize = 20;
  final Point start;
  final Point target;
  final List<List<Node>> grid;
  
  const NodeGrid(
    this.start,
    this.target,
    this.grid,
    {super.key}
  );

  List<List<dn.Node>> getDisplayNodes() {
    return grid.map((l) => l.map((x) => nodeToDisplayNode(x)).toList())
      .toList();
  }

  List<Widget> buildBlocks() {
    final nodes = getDisplayNodes();
    List<Widget> blocks = [];
    for (int i = 0; i < nodes.length; i++) {
      for (int j = 0; j < nodes[i].length; j++) {
        blocks.add(
          Container(
            width: nodeSize,
            height: nodeSize,
            color: nodes[i][j].toColor(),
          )
        );
      }
    }

    return blocks;
  }

  @override
  Widget build(BuildContext context) {
    final double gridWidth = grid.length * nodeSize;
    final double gridHeight = grid[0].length * nodeSize;

    return LayoutBuilder(
      builder: (context, constraints) {
        return InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(70),
          clipBehavior: Clip.none,
          child: Center(
            child: SizedBox(
              width: gridWidth,
              height: gridHeight,
              child: Listener(
                onPointerSignal: (event) {},
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: grid.length,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  children: buildBlocks(),
                ),
              ),
            ),
          )
        );
      }
    );
  }
}


dn.Node nodeToDisplayNode(Node node) {
  return switch (node) {
    Node.idle => dn.Node.idle,
    Node.open => dn.Node.open,
    Node.closed => dn.Node.closed,
    Node.obstacle => dn.Node.obstacle,
  };
}