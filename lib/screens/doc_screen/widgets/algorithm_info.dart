
import 'package:flutter/material.dart';

class AlgorithmInfo extends StatelessWidget {
  final String title;
  final String description;

  const AlgorithmInfo(
    this.title,
    this.description,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(description, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}