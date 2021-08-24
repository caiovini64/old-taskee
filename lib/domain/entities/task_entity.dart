import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String state;

  TaskEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.state,
  });

  @override
  List<Object?> get props => [id, title, subtitle, state];
}
