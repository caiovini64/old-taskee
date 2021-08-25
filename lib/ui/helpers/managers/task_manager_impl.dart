import 'package:taskee/domain/entities/task_entity.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/helpers/managers/task_manager.dart';

enum StateTaskUpdate {
  forward,
  back,
}

class TaskManager implements ITaskManager {
  final List<TaskEntity> taskList;
  TaskManager(this.taskList);

  @override
  updateTaskState(TaskEntity task, StateTaskUpdate stateTaskUpdate) {
    if (stateTaskUpdate == StateTaskUpdate.forward) {
      if (task.state == TaskState.todo.description) return TaskState.progress;
      if (task.state == TaskState.progress.description) return TaskState.done;
      return TaskState.progress;
    } else {
      if (task.state == TaskState.progress.description) return TaskState.todo;
      if (task.state == TaskState.done.description) return TaskState.progress;
      return TaskState.todo;
    }
  }

  @override
  saveTask(TaskEntity task) {
    taskList.add(TaskEntity(
      id: task.id,
      title: task.title,
      content: task.content,
      state: task.state,
    ));
  }

  @override
  saveTaskList(List<TaskEntity> tasks) {
    if (taskList.isEmpty) taskList.addAll(tasks);
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
