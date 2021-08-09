import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/helpers/helpers.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/data/usecases/usecases.dart';

import '../../mock/user_mocks.dart';

class MockRegisterDatasource extends Mock implements IRegisterDatasource {}

void main() {
  late IRegisterUsecase usecase;
  late IRegisterDatasource datasource;
  late String email;
  late String password;

  setUp(() {
    datasource = MockRegisterDatasource();
    usecase = RegisterUsecase(datasource);
    email = faker.internet.email();
    password = faker.internet.password();
  });

  test('should returns an UserModel when calls the datasource', () async {
    when(() => datasource.register(any(), any()))
        .thenAnswer((_) async => kUserModel);
    final result = await usecase.register(email, password);
    expect(result, Right(kUserModel));
  });

  test(
      'should returns a ServerFailure when calls to datasource throws a ServerException',
      () async {
    when(() => datasource.register(any(), any())).thenThrow(ServerException());
    final result = await usecase.register(email, password);
    expect(result, Left(ServerFailure()));
  });

  test(
      'should returns a AuthenticationFailure when calls to datasource throws a AuthenticationException',
      () async {
    when(() => datasource.register(any(), any())).thenThrow(
        AuthenticationException(code: 404, message: 'INVALID_EMAIL'));
    final result = await usecase.register(email, password);
    expect(result,
        Left(AuthenticationFailure(code: 404, message: 'INVALID_EMAIL')));
  });
}
