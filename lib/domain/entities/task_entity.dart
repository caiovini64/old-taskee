import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String content;
  final String state;

  TaskEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.state,
  });

  @override
  List<Object?> get props => [id, title, content, state];
}
