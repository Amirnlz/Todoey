import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

enum Priority {
  important,
  high,
  medium,
  low,
  optional,
}

List<Priority> priorityList = [
  Priority.important,
  Priority.high,
  Priority.medium,
  Priority.low,
  Priority.optional,
];

extension ParseToString on Priority {
  String toShortString() {
    return toString().split('.').last;
  }

  int comparePriority(Priority other) => index.compareTo(other.index);
}

final kDropDownDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(12)),
  border: Border.all(
    color: Colors.lightBlueAccent,
    width: 1.3,
  ),
);

final kNeumorphicButtonStyle = NeumorphicStyle(
  shape: NeumorphicShape.convex,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
  color: Colors.lightBlueAccent,
);
