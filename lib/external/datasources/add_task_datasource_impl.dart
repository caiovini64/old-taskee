import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/helpers.dart';
import 'package:taskee/infra/models/models.dart';

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
