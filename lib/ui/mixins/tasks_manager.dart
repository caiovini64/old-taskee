import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';

mixin TasksManager {
  filterTasks(
      {required List<TaskEntity> taskList, required TaskState taskState}) {
    return _filterTag(taskList, taskState);
  }

  _filterTag(List<TaskEntity> taskList, TaskState taskState) {
    return taskList
        .where((element) => element.state.contains(taskState.description))
        .toList();
  }
}
