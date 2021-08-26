import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/helpers/managers/task_manager_impl.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/helpers/managers/task_manager.dart';

import '../../../mock/task_mocks.dart';

class TaskListMock extends Mock implements List<TaskEntity> {}

void main() {
  late ITaskManager taskManager;
  late List<TaskEntity> taskList;

  setUp(() {
    taskList = TaskListMock();
    taskManager = TaskManager(taskList);
  });

  test('should return TaskState.progress when task state was todo ', () async {
    final result =
        taskManager.updateTaskState(kTaskEntity, StateTaskUpdate.forward);
    expect(result, TaskStatus.progress);
  });

  test('should return TaskState.done when task state was progress ', () async {
    final result = taskManager.updateTaskState(
        kTaskEntityProgress, StateTaskUpdate.forward);
    expect(result, TaskStatus.done);
  });
}
