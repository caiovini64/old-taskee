import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/exceptions/exceptions.dart';
import 'package:taskee/infra/repositories/usecases.dart';

class MockAddTaskDatasource extends Mock implements IAddTaskDatasource {}

void main() {
  late IAddTaskUsecase usecase;
  late IAddTaskDatasource datasource;

  setUp(() {
    datasource = MockAddTaskDatasource();
    usecase = AddTaskUsecase(datasource);
  });

  test('should returns a TaskModel when calls the datasource', () async {
    when(() => datasource.addTask('title', 'subtitle', 'todo'))
        .thenAnswer((_) async => 'kTaskModel');

    final result = await usecase.addTask('title', 'subtitle', 'todo');
    expect(result, Right('kTaskModel'));
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
