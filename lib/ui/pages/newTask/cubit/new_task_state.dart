part of 'new_task_cubit.dart';

abstract class NewTaskState extends Equatable {
  const NewTaskState();

  @override
  List<Object> get props => [];
}

class Initial extends NewTaskState {}

class Loading extends NewTaskState {}

class Error extends NewTaskState {
  final String error;

  Error(this.error);
}

class Success extends NewTaskState {}
