part of 'home_cubit.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskError extends TaskState {
  final String failure;
  TaskError(this.failure);
}

class TaskDone extends TaskState {
  final List<TaskEntity> taskList;
  TaskDone(this.taskList);
}
