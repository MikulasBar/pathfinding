import 'package:flutter/material.dart';

class TaskStats extends StatelessWidget {
  final Duration duration;
  final String name;
  final int? path;
  final VoidCallback cb;

  const TaskStats(
    this.path,
    this.duration,
    this.name,
    this.cb,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        '${duration.inMilliseconds} ms',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      if (path != null) ...[
                        Text(
                          '$path nodes',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        )
                      ]
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              color: Colors.red,
              iconSize: 30.0,
              onPressed: cb,
            ),
          ],
        ),
      ),
    );
  }
}