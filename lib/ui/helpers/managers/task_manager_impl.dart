import 'package:taskee/domain/entities/task_entity.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/helpers/managers/task_manager.dart';

class TaskManager implements ITaskManager {
  final List<TaskEntity> taskList;
  TaskManager(this.taskList);

  @override
  updateTaskState(TaskEntity task) {
    if (task.state == TaskState.todo.description) return TaskState.progress;
    if (task.state == TaskState.progress.description) return TaskState.done;
    return TaskState.progress;
  }

  @override
  saveTask(TaskEntity task) {
    taskList.add(TaskEntity(
      id: task.id,
      title: task.title,
      subtitle: task.subtitle,
      state: task.state,
    ));
  }

  @override
  saveTaskList(List<TaskEntity> taskList) {
    if (taskList.isEmpty) taskList.addAll(taskList);
  }

  @override
  updateTask(TaskEntity task) {
    final taskIndex = taskList.indexWhere((element) => element.id == task.id);
    taskList[taskIndex] = task;
  }

  @override
  deleteTask(TaskEntity task) {
    final taskIndex = taskList.indexWhere((element) => element.id == task.id);
    final deletedTask = taskList[taskIndex];
    taskList.remove(deletedTask);
  }
}
