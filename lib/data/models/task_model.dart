import 'package:taskee/domain/entities/entities.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required String id,
    required String title,
    required String subtitle,
    required String state,
  }) : super(id: id, title: title, content: subtitle, state: state);

  factory TaskModel.fromMap(key, value) {
    return TaskModel(
      id: key,
      title: value['title'],
      subtitle: value['subtitle'],
      state: value['state'],
    );
  }

  toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subtitle': content,
      'state': state,
    };
  }
}
