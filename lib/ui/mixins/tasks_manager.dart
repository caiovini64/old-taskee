import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';

mixin TasksManager {
  filterTasks(
      {required List<TaskEntity> taskList, required TaskState taskState}) {
    return taskList
        .where((element) => element.state.contains(taskState.description))
        .toList();
  }

  toState(String taskState) {
    if (taskState == TaskState.todo.description) return TaskState.todo;
    if (taskState == TaskState.progress.description) return TaskState.progress;
    if (taskState == TaskState.done.description) return TaskState.done;
  }
}
