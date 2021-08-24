import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/helpers/failures/failure.dart';
import 'package:taskee/domain/entities/task_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:taskee/domain/usecases/update_task_usecase.dart';

class UpdateTaskUsecase implements IUpdateTaskUsecase {
  final IUpdateTaskDatasource datasource;
  UpdateTaskUsecase(this.datasource);

  @override
  Future<Either<Failure, TaskEntity>> update(TaskEntity task) async {
    final result = await datasource.updateTask(task);
    return Right(result);
  }
}
