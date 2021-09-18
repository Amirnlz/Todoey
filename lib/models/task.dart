class Task {
  late final String description;
  bool isDone;

  Task({required this.description, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
