import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/helpers/failures/failures.dart';
import 'package:taskee/domain/repositories/repositories.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/exceptions/exceptions.dart';
import 'package:taskee/infra/helpers/exceptions/server_exception.dart';
import 'package:taskee/infra/repositories/login_repository_impl.dart';

import '../../mocks.dart';

class MockLoginDatasource extends Mock implements ILoginDatasource {}

void main() {
  late ILoginRepository repository;
  late ILoginDatasource datasource;
  late String email;
  late String password;

  setUp(() {
    datasource = MockLoginDatasource();
    repository = LoginRepository(datasource);
    email = faker.internet.email();
    password = faker.internet.password();
  });

  test('should returns an UserModel when calls the datasource', () async {
    when(() => datasource.login(any(), any()))
        .thenAnswer((_) async => kUserModel);
    final result = await repository.login(email, password);
    expect(result, Right(kUserModel));
  });

  test(
      'should returns a ServerFailure when calls to datasource throws a ServerException',
      () async {
    when(() => datasource.login(any(), any())).thenThrow(ServerException());
    final result = await repository.login(email, password);
    expect(result, Left(ServerFailure()));
  });

  test(
      'should returns a AuthenticationFailure when calls to datasource throws a AuthenticationException',
      () async {
    when(() => datasource.login(any(), any())).thenThrow(
        AuthenticationException(code: 404, message: 'INVALID_EMAIL'));
    final result = await repository.login(email, password);
    expect(result,
        Left(AuthenticationFailure(code: 404, message: 'INVALID_EMAIL')));
  });
}
