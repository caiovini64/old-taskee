import 'package:equatable/equatable.dart';

class TaskStateEntity extends Equatable {
  final String state;

  TaskStateEntity(this.state);

  @override
  List<Object?> get props => [state];
}
