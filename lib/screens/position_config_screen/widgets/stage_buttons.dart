

import 'package:flutter/material.dart';

class StageButtons extends StatelessWidget {
  static const stages = ['Start', 'Target', 'Obstacles'];
  
  final List<bool> isSelected;
  final Function(int) switchStage;

  const StageButtons({
    super.key,
    required this.isSelected,
    required this.switchStage,
  });

  List<Widget> buildOptions() {
    List<Widget> options = [];
    for (var i = 0; i < stages.length; i++) {
      options.add( Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text('${stages[i]}'),
      ));
    }
    return options;
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      fillColor: Colors.red,
      selectedColor: Colors.white,
      borderWidth: 0.0,
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
      isSelected: isSelected,
      onPressed: switchStage,
      children: buildOptions(),
    );
  }
}