import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/external/datasources/login_datasource_impl.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/client/connection_client.dart';
import 'package:taskee/infra/helpers/helpers.dart';

import '../../mocks.dart';

class MockConnectionClient extends Mock implements IConnectionClient {}

void main() {
  late ILoginDatasource datasource;
  late IConnectionClient client;
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

  test('should returns a AuthenticationException when statusCode was 400',
      () async {
    when(() => client.post(any(), body: {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        })).thenAnswer((_) async => HttpResponse(data: '', statusCode: 400));
    final result = await datasource.login(email, password);
    expect(
        result, AuthenticationException(code: 404, message: 'INVALID_EMAIL'));
  });
}
