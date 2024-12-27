

import 'package:flutter/material.dart';
import 'package:gridfind/point.dart';

class OverallStats extends StatelessWidget {
  final List<Point>? path;
  
  const OverallStats({
    super.key,
    required this.path,
  });

  bool get isDoable => path != null;
  int? get len => path?.length;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Is doable:") // TODO
      ],
    );
  }
}