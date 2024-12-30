import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gridfind/gridfind.dart';
import 'package:path_finding/screens/animation_screen/widgets/node_grid.dart';

@RoutePage()
class AnimationScreen extends StatefulWidget {
  final PathFindingState state;
  final PathFindingStrategy alg;
  final String name;

  const AnimationScreen( // TODO: fix the build_runner
    this.state,
    this.alg,
    this.name,
    {super.key}
  );

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  late PathFindingState state;
  Timer? timer;
  bool isRunning = false;
  bool finished = false;

  @override
  void initState() {
    super.initState();
    state = widget.state.copy();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void handlePauseButton() {
    if (isRunning) {
      stopTimer();
    } else {
      startTimer();
    }
  }

  void startTimer() {
    const freq = Duration(milliseconds: 45);
    if (!finished) {
      setState(() {
        timer = Timer.periodic(freq, (_) => tick());
        isRunning = true;
      });
    }
  }

  void stopTimer() {
    setState(() {
      timer?.cancel();
      isRunning = false;
    });
  }

  void tick() {
    setState(() {
      if (state.status == Status.search) {
        widget.alg.searchStep(state);
      } else {
        stopTimer();
        finished = true;
      }
    });
  }

  void reset() {
    setState(() {
      state = widget.state.copy();
      finished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text(widget.name), backgroundColor: Colors.red),
      body: Stack(
        children: [
          NodeGrid(state.start, state.target, state.grid),
          Positioned(
            bottom: 16,
            right: 16,
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: isRunning ? null : reset,
                  backgroundColor: isRunning ? Colors.grey : Colors.orange,
                  child: const Icon(Icons.restore),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: isRunning || finished ? null : tick,
                  backgroundColor: isRunning || finished ? Colors.grey : Colors.blue,
                  child: const Icon(Icons.skip_next),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: finished ? null : (isRunning ? stopTimer : startTimer),
                  backgroundColor: finished ? Colors.grey : Colors.red,
                  child: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
