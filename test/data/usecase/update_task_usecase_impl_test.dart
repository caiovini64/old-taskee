import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/data/usecases/usecases.dart';
import 'package:taskee/domain/datasources/update_task_datasource.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/usecases/update_task_usecase.dart';

import '../../mock/task_mocks.dart';

class UpdateTaskDatasourceMock extends Mock implements IUpdateTaskDatasource {}

class TaskEntityFake extends Fake implements TaskEntity {}

void main() {
  late IUpdateTaskUsecase usecase;
  late IUpdateTaskDatasource datasource;

  setUpAll(() {
    registerFallbackValue(TaskEntityFake());
  });

  setUp(() {
    datasource = UpdateTaskDatasourceMock();
    usecase = UpdateTaskUsecase(datasource);
  });

  test('should returns a TaskModel when calls the datasource', () async {
    when(() => datasource.updateTask(any()))
        .thenAnswer((_) async => kTaskModel);
    final result = await usecase.update(kTaskEntity);
    expect(result, Right(kTaskModel));
  });
  test(
      'should returns a ServerFailure when calls to datasource throws a ServerException',
      () async {
    when(() => datasource.updateTask(any())).thenThrow(ServerException());
    final result = await usecase.update(kTaskEntity);
    expect(result, Left(ServerFailure()));
  });
}
