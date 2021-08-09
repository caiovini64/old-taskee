import 'package:taskee/domain/entities/entities.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required int id,
    required String title,
    required String subtitle,
    required String state,
  }) : super(id: id, title: title, subtitle: subtitle, state: state);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      state: json['state'],
    );
  }

  toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'state': state,
    };
  }
}
