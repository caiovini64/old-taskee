import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/data/usecases/usecases.dart';

import '../../mock/task_mocks.dart';

class MockAddTaskDatasource extends Mock implements IAddTaskDatasource {}

void main() {
  late IAddTaskUsecase usecase;
  late IAddTaskDatasource datasource;

  setUp(() {
    datasource = MockAddTaskDatasource();
    usecase = AddTaskUsecase(datasource);
  });

  test('should returns a TaskResponseModel when calls the datasource',
      () async {
    when(() => datasource.addTask('title', 'subtitle', 'todo'))
        .thenAnswer((_) async => kTaskResponseModel);

    final result = await usecase.addTask('title', 'subtitle', 'todo');
    expect(result, Right(kTaskResponseModel));
  });

  test(
      'should returns a ServerFailure when the datasource throws a ServerException',
      () async {
    when(() => datasource.addTask('title', 'subtitle', 'todo'))
        .thenThrow(ServerException());

    final result = await usecase.addTask('title', 'subtitle', 'todo');
    expect(result, Left(ServerFailure()));
  });
}
