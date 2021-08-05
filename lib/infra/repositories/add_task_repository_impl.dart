import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/repositories/repositories.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/exceptions/exceptions.dart';

class AddTaskRepository implements IAddTaskRepository {
  final IAddTaskDatasource datasource;
  AddTaskRepository(this.datasource);

  @override
  Future<Either<Failure, String>> addTask(
      String title, String subtitle, String state) async {
    try {
      final result = await datasource.addTask(title, subtitle, state);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
