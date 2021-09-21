class Task {
  late final String description;
  bool isDone;
  String taskPriority;

  Task({
    required this.description,
    this.isDone = false,
    this.taskPriority = 'Medium',
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
