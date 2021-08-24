import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/data/helpers/exceptions/exceptions.dart';

import 'package:taskee/data/usecases/usecases.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/usecases/usecases.dart';

import '../../mock/task_mocks.dart';

class MockGetTasksDatasource extends Mock implements IGetTasksDatasource {}

void main() {
  late IGetTasksUsecase usecase;
  late IGetTasksDatasource datasource;

  setUp(() {
    datasource = MockGetTasksDatasource();
    usecase = GetTasksUsecase(datasource);
  });

  test('should returns a list of TaskEntity when calls the datasource succeeds',
      () async {
    when(() => datasource.getTasks()).thenAnswer((_) async => kListTaskModel);
    final result = await usecase.getTasks();
    expect(result, Right(kListTaskModel));
  });

  test(
      'should returns a ServerFailure when the datasource throws a ServerException',
      () async {
    when(() => datasource.getTasks()).thenThrow(ServerException());
    final result = await usecase.getTasks();
    expect(result, Left(ServerFailure()));
  });
}
