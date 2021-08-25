import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/entities.dart';

abstract class IDeleteTaskDatasource {
  Future<TaskResponseEntity> deleteTask(TaskEntity task);
}
