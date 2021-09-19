import 'task.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(description: 'read a book'),
    Task(description: 'listen to podcast'),
    Task(description: 'watch the movie'),
  ];

  UnmodifiableListView<Task> get getTasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskTitle) {
    _tasks.add(Task(description: taskTitle));
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
