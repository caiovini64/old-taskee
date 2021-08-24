import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class IGetTasksUsecase {
  Future<Either<Failure, List<TaskEntity>>> getTasks();
}
