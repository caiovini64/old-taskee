import 'package:taskee/domain/entities/entities.dart';

class TaskResponseModel extends TaskResponseEntity {
  TaskResponseModel(String name) : super(name);

  factory TaskResponseModel.fromJson(Map<String, dynamic> json) {
    return TaskResponseModel(json['name']);
  }
}
