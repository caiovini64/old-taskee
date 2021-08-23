import 'package:dartz/dartz.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class IAddTaskUsecase {
  Future<Either<Failure, TaskResponseEntity>> addTask(
      String title, String subtitle, String state);
}
