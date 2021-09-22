import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Priority taskPriority;
  final Function(bool?) checkCallback;
  final Function()? logPressCallback;

  const TaskTile(
      {Key? key,
      required this.isChecked,
      required this.taskTitle,
      required this.taskPriority,
      required this.checkCallback,
      required this.logPressCallback})
      : super(key: key);

  Color getPriorityColor() {
    if (taskPriority == Priority.important) {
      return Colors.red;
    } else if (taskPriority == Priority.high) {
      return Colors.orange;
    } else if (taskPriority == Priority.medium) {
      return Colors.blueGrey;
    } else if (taskPriority == Priority.low) {
      return Colors.green;
    } else {
      return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkCallback,
      ),
      subtitle: Text(
        taskPriority.toShortString(),
        style: TextStyle(
          color: getPriorityColor(),
        ),
      ),
      onLongPress: logPressCallback,
    );
  }
}
