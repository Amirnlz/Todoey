import 'package:todoey_flutter/constants.dart';

class Task {
  late final String description;
  bool isDone;
  Priority taskPriority;

  Task({
    required this.description,
    this.isDone = false,
    this.taskPriority = Priority.medium,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
