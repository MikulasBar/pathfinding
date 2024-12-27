import 'package:flutter/material.dart';
import 'package:gridfind/point.dart';

import '../node.dart';

class ChangeableGrid extends StatelessWidget {
  static const nodeSize = 20.0;
  final List<List<Node>> nodes;
  final Function(Point) onNodeClick;
  
  const ChangeableGrid({
    super.key,
    required this.nodes,
    required this.onNodeClick,
  });
  
  List<Widget> buildBlocks() {
    List<Widget> blocks = [];
    for (int i = 0; i < nodes.length; i++) {
      for (int j = 0; j < nodes[i].length; j++) {
        blocks.add(GestureDetector(
          onTap: () => onNodeClick(Point(i, j)),
          child: Container(
            width: nodeSize,
            height: nodeSize,
            color: nodes[i][j].toColor(),
          ),
        ));
      }
    }

    return blocks;
  }

  @override
  Widget build(BuildContext context) {
    final double gridWidth = nodes.length * nodeSize;
    final double gridHeight = nodes[0].length * nodeSize;


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
                  crossAxisCount: nodes.length,
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                  children: buildBlocks(),
                ),
              ),
            ),
          )
        );
      },
    );
  }
}

