import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

List<String> priorityList = [
  'Important',
  'High',
  'Medium',
  'Low',
  'Optional',
];

List<Text> priorityList2 = const [
  Text(
    'Important',
    style: TextStyle(color: Colors.red),
  ),
  Text(
    'High',
    style: TextStyle(color: Colors.orange),
  ),
  Text(
    'Medium',
    style: TextStyle(color: Colors.blueGrey),
  ),
  Text(
    'Low',
    style: TextStyle(color: Colors.green),
  ),
  Text(
    'Optional',
    style: TextStyle(color: Colors.purple),
  ),
];

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
