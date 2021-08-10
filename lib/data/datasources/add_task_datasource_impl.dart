import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/data/helpers/helpers.dart';
import 'package:taskee/data/models/models.dart';

class AddTaskDatasource extends IAddTaskDatasource {
  final IConnectionClient client;
  final String url;
  final UserModel user;
  AddTaskDatasource({
    required this.client,
    required this.url,
    required this.user,
  });

  @override
  Future<String> addTask(String title, String subtitle, String state) async {
    final apiUrl = url + 'tasks/' + user.id + '.json';
    final response = await client.post(
      apiUrl,
      body: {
        "title": title,
        "subtitle": subtitle,
        "state": state,
      },
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException();
    }
  }
}
