import 'dart:convert';

import 'package:taskee/data/helpers/exceptions/exceptions.dart';
import 'package:taskee/data/models/models.dart';
import 'package:taskee/data/models/task_model.dart';
import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/entities/task_entity.dart';

class UpdateTaskDatasource implements IUpdateTaskDatasource {
  final IHttpClient client;
  final String url;
  final UserModel user;

  UpdateTaskDatasource({
    required this.client,
    required this.url,
    required this.user,
  });

  @override
  Future<TaskModel> updateTask(TaskEntity task) async {
    final apiUrl = url + 'tasks/' + user.id + '/' + task.id + '.json';
    final response = await client.patch(
      apiUrl,
      body: {
        "title": task.title,
        "subtitle": task.content,
        "state": task.state,
      },
    );
    if (response.statusCode == 200) {
      print(response.data);
      final json = jsonDecode(response.data);
      return TaskModel.fromMap(task.id, json);
    } else {
      throw ServerException();
    }
  }
}
