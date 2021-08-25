import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class IDeleteTaskUsecase {
  Future<Either<Failure, TaskResponseEntity>> deleteTask(TaskEntity task);
}
