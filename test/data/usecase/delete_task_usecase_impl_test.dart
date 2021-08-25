import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/data/helpers/exceptions/exceptions.dart';
import 'package:taskee/data/usecases/usecases.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/usecases/usecases.dart';

import '../../mock/task_mocks.dart';

class DeleteTaskDatasourceMock extends Mock implements IDeleteTaskDatasource {}

class TaskEntityFake extends Fake implements TaskEntity {}

void main() {
  late IDeleteTaskUsecase usecase;
  late IDeleteTaskDatasource datasource;

  setUpAll(() {
    registerFallbackValue(TaskEntityFake());
  });

  setUp(() {
    datasource = DeleteTaskDatasourceMock();
    usecase = DeleteTaskUsecase(datasource);
  });

  test('should returns null when succeeds', () async {
    when(() => datasource.deleteTask(any())).thenAnswer((_) async => null);
    final result = await usecase.deleteTask(kTaskEntity);
    expect(result, Right(null));
    verify(() => datasource.deleteTask(kTaskEntity));
  });
  test(
      'should returns a ServerFailure when calls to datasource throws a ServerException',
      () async {
    when(() => datasource.deleteTask(any())).thenThrow(ServerException());

    final result = await usecase.deleteTask(kTaskEntity);
    expect(result, Left(ServerFailure()));
  });
}
