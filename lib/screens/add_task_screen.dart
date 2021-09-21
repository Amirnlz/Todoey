import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/constants.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String taskTitle;
  String taskPriority = 'Medium';

  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> itemList = [];
    for (String priority in priorityList) {
      var newItem = DropdownMenuItem(
        child: Text(priority),
        value: priority,
      );
      itemList.add(newItem);
    }
    return itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        taskTitle = value;
                      },
                    ),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  decoration: kDropDownDecoration,
                  child: DropdownButton<String>(
                    items: getDropDownItems(),
                    value: taskPriority,
                    onChanged: (value) {
                      setState(() {
                        taskPriority = value!;
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
            NeumorphicButton(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12.0),
              style: kNeumorphicButtonStyle,
              child: const Text(
                'Add',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskTitle, taskPriority);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
