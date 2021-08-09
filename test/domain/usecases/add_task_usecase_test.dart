// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:taskee/domain/helpers/failures/failures.dart';
// import 'package:taskee/domain/repositories/repositories.dart';
// import 'package:taskee/domain/usecases/usecases.dart';

// class MockAddTaskRepository extends Mock implements IAddTaskRepository {}

// void main() {
//   late AddTaskUsecase usecase;
//   late IAddTaskRepository repository;

//   setUp(() {
//     repository = MockAddTaskRepository();
//     usecase = AddTaskUsecase(repository);
//   });

//   test('should returns a String', () async {
//     when(() => repository.addTask('title', 'subtitle', 'todo'))
//         .thenAnswer((_) async => Right(''));
//     final result = await usecase('title', 'subtitle', 'todo');
//     expect(result, Right(''));
//   });

//   test('should returns a ServerFailure when dont succeed', () async {
//     when(() => repository.addTask('title', 'subtitle', 'todo'))
//         .thenAnswer((_) async => Left(ServerFailure()));
//     final result = await usecase('title', 'subtitle', 'todo');
//     expect(result, Left(ServerFailure()));
//   });
// }
