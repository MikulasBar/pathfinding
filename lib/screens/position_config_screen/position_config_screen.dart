

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PositionConfigScreen extends StatefulWidget {
  const PositionConfigScreen({super.key});

  @override
  State<PositionConfigScreen> createState() => _PositionConfigScreenState();
}

class _PositionConfigScreenState extends State<PositionConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Position Config Screen'), // TODO: Implement this screen
      ),
    );
  }
}