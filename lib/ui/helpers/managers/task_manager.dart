import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/helpers/managers/task_manager_impl.dart';

abstract class ITaskManager {
  saveTaskList(List<TaskEntity> taskList);
  saveTask(TaskEntity task);
  updateTask(TaskEntity task);
  updateTaskState(TaskEntity task, StateTaskUpdate stateTaskUpdate);
  deleteTask(TaskEntity task);
}
