part of 'new_task_cubit.dart';

abstract class NewTaskState extends Equatable {
  const NewTaskState();

  @override
  List<Object> get props => [];
}

class NewTaskInitial extends NewTaskState {}

class NewTaskLoading extends NewTaskState {}

class NewTaskError extends NewTaskState {
  final String error;

  NewTaskError(this.error);
}

class NewTaskSuccess extends NewTaskState {}
