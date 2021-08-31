import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/data/helpers/exceptions/exceptions.dart';
import 'package:taskee/data/usecases/reset_password_usecase_impl.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/usecases/usecases.dart';

class MockResetPasswordDatasource extends Mock
    implements IResetPasswordDatasource {}

void main() {
  late IResetPasswordUsecase usecase;
  late IResetPasswordDatasource datasource;
  late String email;
  late String password;
  late String code;

  setUp(() {
    datasource = MockResetPasswordDatasource();
    usecase = ResetPasswordUsecase(datasource);
    email = faker.internet.email();
    password = faker.internet.password();
    code = faker.internet.password();
  });

  group('sendPasswordResetEmail', () {
    test('should returns a String when calls to datasource succeeds', () async {
      when(() => datasource.sendPasswordResetEmail(any()))
          .thenAnswer((_) async => 'email');
      final result = await usecase.sendPasswordResetEmail(email);
      expect(result, Right('email'));
    });

    test(
        'should returns a ServerFailure when calls to datasource throws a ServerException',
        () async {
      when(() => datasource.sendPasswordResetEmail(any()))
          .thenThrow(ServerException());
      final result = await usecase.sendPasswordResetEmail(email);
      expect(result, Left(ServerFailure()));
    });
    test(
        'should returns a AuthenticationFailure when calls to datasource throws a AuthenticationException',
        () async {
      when(() => datasource.sendPasswordResetEmail(any()))
          .thenThrow(AuthenticationException(code: 404, message: 'error'));
      final result = await usecase.sendPasswordResetEmail(email);
      expect(result, Left(AuthenticationFailure(code: 404, message: 'error')));
    });
  });

  group('confirmPasswordReset', () {
    test('should returns a String when calls to datasource succeeds', () async {
      when(() => datasource.confirmPasswordReset(any(), any()))
          .thenAnswer((_) async => 'email');
      final result = await usecase.confirmPasswordReset(code, password);
      expect(result, Right('email'));
    });
    test(
        'should returns a ServerFailure when calls to datasource throws a ServerException',
        () async {
      when(() => datasource.confirmPasswordReset(any(), any()))
          .thenThrow(ServerException());
      final result = await usecase.confirmPasswordReset(code, password);
      expect(result, Left(ServerFailure()));
    });
    test(
        'should returns a AuthenticationFailure when calls to datasource throws a AuthenticationException',
        () async {
      when(() => datasource.confirmPasswordReset(any(), any()))
          .thenThrow(AuthenticationException(code: 404, message: 'error'));
      final result = await usecase.confirmPasswordReset(code, password);
      expect(result, Left(AuthenticationFailure(code: 404, message: 'error')));
    });
  });
}
