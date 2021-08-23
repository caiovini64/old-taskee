import 'package:equatable/equatable.dart';

class TaskResponseEntity extends Equatable {
  final String name;
  TaskResponseEntity(this.name);

  @override
  List<Object?> get props => [name];
}
