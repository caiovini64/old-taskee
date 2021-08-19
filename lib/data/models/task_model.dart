import 'package:taskee/domain/entities/entities.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required String title,
    required String subtitle,
    required String state,
  }) : super(title: title, subtitle: subtitle, state: state);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      subtitle: json['subtitle'],
      state: json['state'],
    );
  }

  toJson() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'state': state,
    };
  }
}
