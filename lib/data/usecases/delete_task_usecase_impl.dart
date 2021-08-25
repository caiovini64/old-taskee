import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:taskee/domain/entities/task_response_entity.dart';
import 'package:taskee/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/usecases/usecases.dart';

class DeleteTaskUsecase implements IDeleteTaskUsecase {
  final IDeleteTaskDatasource datasource;
  DeleteTaskUsecase(this.datasource);

  @override
  Future<Either<Failure, void>> deleteTask(TaskEntity task) async {
    final result = await datasource.deleteTask(task);
    return Right(result);
  }
}
