

import 'package:flutter/material.dart';

enum Node {
  idle,
  obstacle,
  start,
  target,
  open,
  closed;
  
  Color toColor() {
    return switch (this) {
      idle => Colors.white,
      obstacle => Colors.black,
      start => Colors.orange,
      target => Colors.blue[600]!,
      open => Colors.green,
      closed => Colors.red,
    };
  }
}