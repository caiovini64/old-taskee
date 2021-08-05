import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/repositories/repositories.dart';

class AddTaskUsecase implements UsecaseWithParams {
  final IAddTaskRepository repository;
  AddTaskUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(String title, String subtitle) async {
    final result = await repository.addTask(title, subtitle);
    return result;
  }
}
