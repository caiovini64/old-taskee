import 'package:taskee/data/models/models.dart';
import 'package:taskee/domain/entities/entities.dart';

abstract class IUpdateTaskDatasource {
  Future<TaskModel> updateTask(TaskEntity task);
}
