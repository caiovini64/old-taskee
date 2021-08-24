import 'package:taskee/data/models/models.dart';

abstract class IGetTasksDatasource {
  Future<List<TaskModel>> getTasks();
}
