enum TaskStatus {
  todo,
  progress,
  done,
}

extension TaskStateExtension on TaskStatus {
  String get description {
    switch (this) {
      case TaskStatus.todo:
        return 'todo';
      case TaskStatus.progress:
        return 'inProgress';
      case TaskStatus.done:
        return 'done';
    }
  }
}
