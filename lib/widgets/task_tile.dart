import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final String taskPriority;
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
    if (taskPriority == 'Important') {
      return Colors.red;
    } else if (taskPriority == 'High') {
      return Colors.orange;
    } else if (taskPriority == 'Medium') {
      return Colors.blueGrey;
    } else if (taskPriority == 'Low') {
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
        taskPriority,
        style: TextStyle(
          color: getPriorityColor(),
        ),
      ),
      onLongPress: logPressCallback,
    );
  }
}
