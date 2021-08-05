import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/helpers.dart';

class AddTaskDatasource extends IAddTaskDatasource {
  final IConnectionClient client;
  final String url;
  AddTaskDatasource({
    required this.client,
    required this.url,
  });

  @override
  Future<String> addTask(String title, String subtitle, String state) async {
    final response = await client.post(
      url,
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
