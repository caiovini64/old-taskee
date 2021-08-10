import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/data/datasources/datasources.dart';
import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/domain/helpers/helpers.dart';

import '../../mock/user_mocks.dart';

class MockConnectionClient extends Mock implements IConnectionClient {}

void main() {
  late IRegisterDatasource datasource;
  late IConnectionClient client;
  late String email;
  late String password;
  late String url;

  setUp(() {
    email = faker.internet.email();
    password = faker.internet.password();
    url = faker.internet.httpUrl();
    client = MockConnectionClient();
    datasource = RegisterDatasource(client: client, url: url);
  });

  test('should returns an UserModel', () async {
    when(() => client.post(any(), body: {
              "email": email,
              "password": password,
              "returnSecureToken": true,
            }))
        .thenAnswer(
            (_) async => HttpResponse(data: kUserJson, statusCode: 200));
    final result = await datasource.register(email, password);
    expect(result, kUserModel);
  });

  test('should returns an AuthenticationException when statusCode was 400',
      () async {
    when(() => client.post(any(), body: {
              "email": email,
              "password": password,
              "returnSecureToken": true,
            }))
        .thenAnswer(
            (_) async => HttpResponse(data: dataErrorJson, statusCode: 400));
    expect(
      datasource.register(email, password),
      throwsA(isA<AuthenticationException>()),
    );
  });

  test('should returns a ServerException when dont succeed', () async {
    when(() => client.post(any(), body: {
              "email": email,
              "password": password,
              "returnSecureToken": true,
            }))
        .thenAnswer(
            (_) async => HttpResponse(data: dataErrorJson, statusCode: 404));
    expect(
      datasource.register(email, password),
      throwsA(isA<ServerException>()),
    );
  });
}
