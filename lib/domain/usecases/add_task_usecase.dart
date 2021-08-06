import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/repositories/repositories.dart';

class AddTaskUsecase {
  final IAddTaskRepository repository;
  AddTaskUsecase(this.repository);

  Future<Either<Failure, String>> call(
      String title, String subtitle, String state) async {
    final result = await repository.addTask(title, subtitle, state);
    return result;
  }
}
