import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}