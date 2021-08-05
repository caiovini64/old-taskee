import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class IAddTaskRepository {
  Future<Either<Failure, TaskEntity>> addTask(String title, String subtitle);
}
