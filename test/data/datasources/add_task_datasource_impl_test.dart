import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/domain/adapters/http/http_client.dart';
import 'package:taskee/domain/adapters/http/http_response.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/data/datasources/datasources.dart';
import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/data/models/models.dart';

import '../../mock/task_mocks.dart';

class MockConnectionClient extends Mock implements IHttpClient {}

void main() {
  late IAddTaskDatasource datasource;
  late IHttpClient client;
  late String url;
  late UserModel user;
  late String email;

  setUp(() {
    client = MockConnectionClient();
    url = faker.internet.httpsUrl();
    email = faker.internet.email();
    user = UserModel(email: email, id: '2', token: 'a');
    datasource = AddTaskDatasource(client: client, url: url, user: user);
  });

  test('should returns a TaskResponseModel', () async {
    when(() => client.post(any(), body: {
              "title": 'title',
              "subtitle": 'subtitle',
              "state": "state",
            }))
        .thenAnswer((_) async =>
            HttpResponse(data: '{"name":"name"}', statusCode: 200));
    final result = await datasource.addTask('title', 'subtitle', 'state');
    expect(result, kTaskResponseModel);
  });

  test('should returns a ServerException when dont succeed', () async {
    when(() => client.post(any(), body: {
              "title": 'title',
              "subtitle": 'subtitle',
              "state": "state",
            }))
        .thenAnswer((_) async => HttpResponse(
            data: '{"name":"-MgLp4Etn6NlUvFJXur5"}', statusCode: 404));
    expect(
      datasource.addTask('title', 'subtitle', 'state'),
      throwsA(isA<ServerException>()),
    );
  });
}
