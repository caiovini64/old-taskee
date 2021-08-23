import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/entities.dart';

abstract class IAddTaskDatasource {
  Future<TaskResponseEntity> addTask(
      String title, String subtitle, String state);
}
