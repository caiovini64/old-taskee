import 'package:taskee/domain/entities/entities.dart';

abstract class IDeleteTaskDatasource {
  Future<void> deleteTask(TaskEntity task);
}
