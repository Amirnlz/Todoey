import 'task.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(description: 'Read a book', taskPriority: 'Important'),
    Task(description: 'Listen to the podcast', taskPriority: 'Medium'),
    Task(description: 'Watch the movie', taskPriority: 'Low'),
  ];

  UnmodifiableListView<Task> get getTasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskTitle, String taskPriority) {
    _tasks.add(Task(description: taskTitle, taskPriority: taskPriority));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
