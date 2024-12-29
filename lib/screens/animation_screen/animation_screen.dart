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

  @override
  void initState() {
    super.initState();
    state = widget.state;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) => tick());
    setState(() {
      isRunning = true;
    });
  }

  void stopTimer() {
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void handlePauseButton() {
    if (isRunning) {
      stopTimer();
    } else {
      startTimer();
    }
  }

  void tick() {
    if (state.status == Status.search) {
      widget.alg.searchStep(state);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text(widget.name), backgroundColor: Colors.red),
      body: Stack(
        children: [
          NodeGrid(state.start, state.target, state.grid),
          ElevatedButton(
            onPressed: handlePauseButton,
            child: isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow)
          ),
        ],
      ),
    );
  }
}