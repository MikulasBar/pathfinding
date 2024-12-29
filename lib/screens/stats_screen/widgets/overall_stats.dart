

import 'package:flutter/material.dart';

class OverallStats extends StatelessWidget {
  final bool isDoable;
  
  const OverallStats(
    this.isDoable,
    {super.key,}
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isDoable ? Icons.check_circle : Icons.cancel,
                  color: isDoable ? Colors.green : Colors.red,
                  size: 32.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  isDoable ? 'Path Found' : 'No Path Found',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // if (isDoable)
            //   Padding(
            //     padding: const EdgeInsets.only(top: 8.0),
            //     child: Text(
            //       'Path length: $pathLen',
            //       style: const TextStyle(
            //         fontSize: 16.0,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}