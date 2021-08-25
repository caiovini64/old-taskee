import 'package:taskee/data/helpers/exceptions/exceptions.dart';
import 'package:taskee/data/models/models.dart';
import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/entities/task_entity.dart';

class DeleteTaskDatasource implements IDeleteTaskDatasource {
  final IHttpClient client;
  final String url;
  final UserModel user;

  DeleteTaskDatasource({
    required this.client,
    required this.url,
    required this.user,
  });
  @override
  Future<void> deleteTask(TaskEntity task) async {
    final apiUrl = url + 'tasks/' + user.id + '/' + task.id + '.json';
    final response = await client.delete(apiUrl);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException();
    }
  }
}
