part of 'new_task_cubit.dart';

abstract class NewTaskState extends Equatable {
  const NewTaskState();

  @override
  List<Object> get props => [];
}

class NewTaskInitial extends NewTaskState {}

class NewTaskLoading extends NewTaskState {}

class NewTaskError extends NewTaskState {}

class NewTaskDone extends NewTaskState {}
