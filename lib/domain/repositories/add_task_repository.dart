import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/helpers.dart';

abstract class IAddTaskRepository {
  Future<Either<Failure, String>> addTask(String title, String subtitle);
}
