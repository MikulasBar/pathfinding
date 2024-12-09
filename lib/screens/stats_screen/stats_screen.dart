import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: const Center(child: Text('Statistics'),),
    );
  }
}