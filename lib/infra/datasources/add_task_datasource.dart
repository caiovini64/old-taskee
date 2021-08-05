import 'package:taskee/infra/models/models.dart';

abstract class IAddTaskDatasource {
  Future<TaskModel> addTask(String title, String subtitle);
}
