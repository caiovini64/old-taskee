import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/external/datasources/datasources.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/client/connection_client.dart';
import 'package:taskee/infra/helpers/helpers.dart';

class MockConnectionClient extends Mock implements IConnectionClient {}

void main() {
  late IAddTaskDatasource datasource;
  late IConnectionClient client;
  late String url;

  setUp(() {
    client = MockConnectionClient();
    url = faker.internet.httpsUrl();
    datasource = AddTaskDatasource(client: client, url: url);
  });

  test('should returns a String', () async {
    when(() => client.post(any(), body: {
              "title": 'title',
              "subtitle": 'subtitle',
              "state": "state",
            }))
        .thenAnswer((_) async => HttpResponse(
            data: '{"name":"-MgLp4Etn6NlUvFJXur5"}', statusCode: 200));
    final result = await datasource.addTask('title', 'subtitle', 'state');
    expect(result, '{"name":"-MgLp4Etn6NlUvFJXur5"}');
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
