enum TaskState {
  todo,
  progress,
  done,
}

extension TaskStateExtension on TaskState {
  String get description {
    switch (this) {
      case TaskState.todo:
        return 'todo';
      case TaskState.progress:
        return 'inProgress';
      case TaskState.done:
        return 'done';
    }
  }
}
