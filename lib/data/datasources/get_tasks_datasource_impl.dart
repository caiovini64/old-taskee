import 'dart:convert';

import 'package:taskee/data/helpers/exceptions/exceptions.dart';
import 'package:taskee/data/models/models.dart';
import 'package:taskee/domain/adapters/adapters.dart';
import 'package:taskee/domain/datasources/datasources.dart';

class GetTasksDatasource implements IGetTasksDatasource {
  final IHttpClient client;
  final String url;
  final UserModel user;
  GetTasksDatasource({
    required this.client,
    required this.url,
    required this.user,
  });

  @override
  Future<List<TaskModel>> getTasks() async {
    final apiUrl = url + 'tasks/' + user.id + '.json';
    final response = await client.get(apiUrl);
    if (response.statusCode == 200) {
      final taskList = <TaskModel>[];
      if (response.data != 'null') {
        final Map<String, dynamic> json = jsonDecode(response.data);
        json.forEach((key, value) {
          final task = TaskModel.fromMap(key, value);
          taskList.add(task);
        });
        return taskList;
      }
      return taskList;
    } else {
      throw ServerException();
    }
  }
}
