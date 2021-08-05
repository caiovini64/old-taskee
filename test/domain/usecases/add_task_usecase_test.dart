import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/repositories/repositories.dart';
import 'package:taskee/domain/usecases/usecases.dart';

import '../../mock/task_mocks.dart';

class MockAddTaskRepository extends Mock implements IAddTaskRepository {}

void main() {
  late AddTaskUsecase usecase;
  late IAddTaskRepository repository;

  setUp(() {
    repository = MockAddTaskRepository();
    usecase = AddTaskUsecase(repository);
  });

  test('should returns a TaskEntity', () async {
    when(() => repository.addTask('title', 'subtitle'))
        .thenAnswer((_) async => Right(kTaskEntity));
    final result = await usecase('title', 'subtitle');
    expect(result, Right(kTaskEntity));
  });

  test('should returns a ServerFailure when dont succeed', () async {
    when(() => repository.addTask('title', 'subtitle'))
        .thenAnswer((_) async => Left(ServerFailure()));
    final result = await usecase('title', 'subtitle');
    expect(result, Left(ServerFailure()));
  });
}
