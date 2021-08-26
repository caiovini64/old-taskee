import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';

mixin TasksManager {
  filterTasks(
      {required List<TaskEntity> taskList, required TaskStatus taskState}) {
    return taskList
        .where((element) => element.state.contains(taskState.description))
        .toList();
  }

  toState(String taskState) {
    if (taskState == TaskStatus.todo.description) return TaskStatus.todo;
    if (taskState == TaskStatus.progress.description)
      return TaskStatus.progress;
    if (taskState == TaskStatus.done.description) return TaskStatus.done;
  }
}
