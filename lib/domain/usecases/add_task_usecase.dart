import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class IAddTaskUsecase {
  Future<Either<Failure, String>> addTask(
      String title, String subtitle, String state);
}
