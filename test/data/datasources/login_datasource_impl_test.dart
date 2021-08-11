import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/adapters/http/http_client.dart';
import 'package:taskee/domain/adapters/http/http_response.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/data/datasources/login_datasource_impl.dart';
import 'package:taskee/data/helpers/helpers.dart';

import '../../mock/user_mocks.dart';

class MockConnectionClient extends Mock implements IHttpClient {}

void main() {
  late ILoginDatasource datasource;
  late IHttpClient client;
  late String email;
  late String password;
  late String url;

  setUp(() {
    email = faker.internet.email();
    password = faker.internet.password();
    url = faker.internet.httpUrl();
    client = MockConnectionClient();
    datasource = LoginDatasource(client: client, url: url);
  });

  test('should returns an UserModel', () async {
    when(() => client.post(any(), body: {
              "email": email,
              "password": password,
              "returnSecureToken": true,
            }))
        .thenAnswer(
            (_) async => HttpResponse(data: kUserJson, statusCode: 200));
    final result = await datasource.login(email, password);
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
      datasource.login(email, password),
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
      datasource.login(email, password),
      throwsA(isA<ServerException>()),
    );
  });
}
