import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/repositories/usecase.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/exceptions/exceptions.dart';

class AddTaskUsecase implements IAddTaskUsecase {
  final IAddTaskDatasource datasource;
  AddTaskUsecase(this.datasource);

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
