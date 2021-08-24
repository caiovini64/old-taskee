// import 'package:faker/faker.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:taskee/data/datasources/datasources.dart';
// import 'package:taskee/data/models/models.dart';
// import 'package:taskee/domain/adapters/adapters.dart';
// import 'package:taskee/domain/datasources/datasources.dart';

// import '../../mock/task_mocks.dart';

// class MockConnectionClient extends Mock implements IHttpClient {}

// void main() {
//   late IUpdateTaskDatasource datasource;
//   late IHttpClient client;
//   late String url;
//   late String email;
//   late UserModel user;

//   setUp(() {
//     client = MockConnectionClient();
//     url = faker.internet.httpUrl();
//     email = faker.internet.email();
//     user = UserModel(email: email, id: '2', token: 'a');
//     datasource = UpdateTaskDatasource(client: client, url: url, user: user);
//   });

//   test('should returns a TaskModel when succeeds', () async {
//     when(() => client.post(any(), body: {
//               "title": 'title',
//               "subtitle": 'subtitle',
//               "state": "state",
//             }))
//         .thenAnswer(
//             (_) async => HttpResponse(data: kTaskJson, statusCode: 200));
//     final result = await datasource.updateTask(kTaskModel);
//     expect(result, kTaskModel);
//   });
// }
