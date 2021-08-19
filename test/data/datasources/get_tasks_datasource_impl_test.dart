import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taskee/data/datasources/datasources.dart';
import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/data/models/models.dart';
import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/entities/entities.dart';

import '../../mock/task_mocks.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late IGetTasksDatasource datasource;
  late IHttpClient client;
  late String url;
  late String email;
  late UserModel user;

  setUp(() {
    client = MockHttpClient();
    url = faker.internet.httpUrl();
    email = faker.internet.email();
    user = UserModel(email: email, id: '2', token: 'a');
    datasource = GetTasksDatasource(client: client, url: url, user: user);
  });

  test('should returns a list of TaskModel when succeeds', () async {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: kListTaskModel, statusCode: 200));
    final result = await datasource.getTasks();
    expect(result, kListTaskModel);
  });
  test('should throws a ServerException when dont succeed', () async {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: kListTaskModel, statusCode: 404));

    expect(datasource.getTasks(), throwsA(isA<ServerException>()));
  });

  test('should returns an empty list when response.data was null', () async {
    when(() => client.get(any()))
        .thenAnswer((_) async => HttpResponse(data: 'null', statusCode: 200));
    final result = await datasource.getTasks();
    expect(result, <TaskEntity>[]);
  });
}
