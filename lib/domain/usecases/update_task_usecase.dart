import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class IUpdateTaskUsecase {
  Future<Either<Failure, TaskEntity>> update(TaskEntity task);
}
