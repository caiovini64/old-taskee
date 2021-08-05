import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/repositories/repositories.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/exceptions/exceptions.dart';
import 'package:taskee/infra/repositories/repositories.dart';

class MockAddTaskDatasource extends Mock implements IAddTaskDatasource {}

void main() {
  late IAddTaskRepository repository;
  late IAddTaskDatasource datasource;

  setUp(() {
    datasource = MockAddTaskDatasource();
    repository = AddTaskRepository(datasource);
  });

  test('should returns a TaskModel when calls the datasource', () async {
    when(() => datasource.addTask('title', 'subtitle', 'todo'))
        .thenAnswer((_) async => 'kTaskModel');

    final result = await repository.addTask('title', 'subtitle', 'todo');
    expect(result, Right('kTaskModel'));
  });

  test(
      'should returns a ServerFailure when the datasource throws a ServerException',
      () async {
    when(() => datasource.addTask('title', 'subtitle', 'todo'))
        .thenThrow(ServerException());

    final result = await repository.addTask('title', 'subtitle', 'todo');
    expect(result, Left(ServerFailure()));
  });
}
