import 'task.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:todoey_flutter/constants.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(description: 'Read a book', taskPriority: Priority.important),
    Task(description: 'Listen to the podcast', taskPriority: Priority.high),
    Task(description: 'Watch the movie', taskPriority: Priority.low),
  ];

  UnmodifiableListView<Task> get getTasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskTitle, Priority taskPriority) {
    _tasks.add(Task(description: taskTitle, taskPriority: taskPriority));
    sortByPriority();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    sortByPriority();
    sortListByNotFinished();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void sortListByNotFinished() {
    for (int i = 0; i < _tasks.length; i++) {
      final task = _tasks[i];
      if (task.isDone) {
        _tasks.remove(task);
        _tasks.insert(_tasks.length, task);
      }
    }
  }

  void sortByPriority() {
    _tasks.sort((a, b) {
      if (a.isDone == b.isDone) {
        return a.taskPriority.comparePriority(b.taskPriority);
      } else {
        return 0;
      }
    });
  }
}
