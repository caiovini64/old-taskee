import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/repositories/repositories.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/repositories/repositories.dart';

import '../../mocks.dart';

class MockRegisterDatasource extends Mock implements IRegisterDatasource {}

void main() {
  late IRegisterRepository repository;
  late IRegisterDatasource datasource;
  late String email;
  late String password;

  setUp(() {
    datasource = MockRegisterDatasource();
    repository = RegisterRepository(datasource);
    email = faker.internet.email();
    password = faker.internet.password();
  });

  test('should returns an UserModel when calls the datasource', () async {
    when(() => datasource.register(any(), any()))
        .thenAnswer((_) async => kUserModel);
    final result = await repository.register(email, password);
    expect(result, Right(kUserModel));
  });
}
