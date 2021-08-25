import 'package:taskee/domain/entities/entities.dart';

abstract class ITaskManager {
  saveTaskList(List<TaskEntity> taskList);
  saveTask(TaskEntity task);
  updateTask(TaskEntity task);
  checkTaskState(TaskEntity task);
}
