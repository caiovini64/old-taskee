import 'package:get_it/get_it.dart';
import 'package:taskee/infra/datasources/datasources.dart';
import 'package:taskee/infra/helpers/helpers.dart';
import 'package:taskee/infra/models/models.dart';

class AddTaskDatasource extends IAddTaskDatasource {
  final IConnectionClient client;
  final String url;
  AddTaskDatasource({
    required this.client,
    required this.url,
  });
  final user = GetIt.instance.get<UserModel>();
  @override
  Future<String> addTask(String title, String subtitle, String state) async {
    final response = await client.post(
      url + 'tasks/' + user.id,
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
