import 'package:taskee/data/helpers/exceptions/exceptions.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:taskee/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/usecases/usecases.dart';

class DeleteTaskUsecase implements IDeleteTaskUsecase {
  final IDeleteTaskDatasource datasource;
  DeleteTaskUsecase(this.datasource);

  @override
  Future<Either<Failure, void>> deleteTask(TaskEntity task) async {
    try {
      final result = await datasource.deleteTask(task);
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    }
  }
}
