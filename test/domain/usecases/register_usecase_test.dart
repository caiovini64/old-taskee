// import 'package:dartz/dartz.dart';
// import 'package:faker/faker.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:taskee/domain/helpers/helpers.dart';
// import 'package:taskee/domain/repositories/repositories.dart';
// import 'package:taskee/domain/usecases/register_usecase.dart';

// import '../../mock/user_mocks.dart';

// class MockRegisterRepository extends Mock implements IRegisterRepository {}

// void main() {
//   late RegisterUsecase usecase;
//   late IRegisterRepository repository;
//   late String email;
//   late String password;

//   setUp(() {
//     repository = MockRegisterRepository();
//     usecase = RegisterUsecase(repository);
//     email = faker.internet.email();
//     password = faker.internet.password();
//   });

//   test(
//       'should returns an UserEntity for a given String email and password from repository',
//       () async {
//     when(() => repository.register(any(), any()))
//         .thenAnswer((_) async => Right(kUserEntity));
//     final result = await usecase(email, password);
//     expect(result, Right(kUserEntity));
//   });

//   test('should returns an AuthenticationFailure when dont succeed', () async {
//     when(() => repository.register(any(), any())).thenAnswer((_) async =>
//         Left(AuthenticationFailure(code: 400, message: 'INVALID_EMAIL')));
//     final result = await usecase(email, password);
//     expect(result,
//         Left(AuthenticationFailure(code: 400, message: 'INVALID_EMAIL')));
//   });
// }
