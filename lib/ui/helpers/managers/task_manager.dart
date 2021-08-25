import 'package:taskee/domain/entities/entities.dart';

abstract class ITaskManager {
  saveTaskList(List<TaskEntity> taskList);
  saveTask(TaskEntity task);
  updateTask(TaskEntity task);
  updateTaskState(TaskEntity task);
  deleteTask(TaskEntity task);
}
