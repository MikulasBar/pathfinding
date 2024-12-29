import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gridfind/node.dart';
import 'package:gridfind/point.dart';

@RoutePage()
class AnimationScreen extends StatefulWidget {
  final Point start;
  final Point target;
  final List<List<Node>> grid;

  const AnimationScreen(
    this.start,
    this.target,
    this.grid,
    {super.key}
  );

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor: Colors.red),
      body: Stack(
        children: [
          
        ],
      ),
    );
  }
}