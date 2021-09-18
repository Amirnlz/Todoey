import 'task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(description: 'read a book'),
    Task(description: 'listen to podcast'),
    Task(description: 'watch the movie'),
  ];

  int get taskCount {
    return tasks.length;
  }
}
