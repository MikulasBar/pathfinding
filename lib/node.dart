

import 'package:flutter/material.dart';

enum Node {
  idle,
  obstacle,
  start,
  target;
  
  Color toColor() {
    return switch (this) {
      idle => Colors.white,
      obstacle => Colors.black,
      start => Colors.orange,
      target => Colors.blue[600]!,
    };
  }
}