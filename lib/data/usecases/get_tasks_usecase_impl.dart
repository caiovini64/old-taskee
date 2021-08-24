import 'package:dartz/dartz.dart';

import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/usecases/usecases.dart';

class GetTasksUsecase implements IGetTasksUsecase {
  final IGetTasksDatasource datasource;
  GetTasksUsecase(this.datasource);

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks() async {
    try {
      final result = await datasource.getTasks();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
