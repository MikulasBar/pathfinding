
import 'package:flutter/material.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem(
    this.color,
    this.label,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          color: color,
        ),
        const SizedBox(width: 8.0),
        Text(label, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
