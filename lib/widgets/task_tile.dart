import 'package:flutter/material.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/screens/task_management.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Priority taskPriority;
  final Function(bool?) checkCallback;

  const TaskTile({
    Key? key,
    required this.isChecked,
    required this.taskTitle,
    required this.taskPriority,
    required this.checkCallback,
  }) : super(key: key);

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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkCallback,
          ),
          GestureDetector(
            child: const Icon(
              Icons.edit,
              color: Colors.grey,
            ),
            onTap: () {
              Provider.of<TaskData>(context, listen: false)
                  .deleteTaskByTitle(taskTitle, taskPriority);
              showModalBottomSheet(
                context: context,
                builder: (context) => TaskManagement(whichTask: taskTitle),
              );
            },
          ),
        ],
      ),
      subtitle: Text(
        taskPriority.toShortString(),
        style: TextStyle(
          color: getPriorityColor(),
        ),
      ),
    );
  }
}
