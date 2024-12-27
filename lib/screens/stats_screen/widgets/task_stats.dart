

import 'package:flutter/material.dart';

class TaskStats extends StatelessWidget {
  final String name;
  final Duration duration;
  
  const TaskStats({
    super.key,
    required this.name,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Duration:") // TODO
      ],
    );
  }
}