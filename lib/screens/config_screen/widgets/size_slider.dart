

import 'package:flutter/material.dart';

class SizeSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double minSize;
  final double maxSize;

  const SizeSlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.minSize,
    required this.maxSize,
  });

  int get divisions => (maxSize - minSize).toInt();

  @override
  Widget build(BuildContext context) {
    return Slider(
      label: '${value.toInt()}',
      divisions: divisions,
      min: minSize,
      max: maxSize,
      value: value.toDouble(),
      onChanged: onChanged,
    );
  }
}