import 'package:equatable/equatable.dart';
import 'package:taskee/domain/entities/entities.dart';

class TaskEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final TaskStateEntity state;

  TaskEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.state,
  });

  @override
  List<Object?> get props => [id, title, subtitle, state];
}
