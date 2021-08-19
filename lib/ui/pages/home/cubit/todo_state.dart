part of 'todo_cubit.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoError extends TodoState {
  final String failure;
  TodoError(this.failure);
}

class TodoDone extends TodoState {
  final List<TaskEntity> taskList;
  TodoDone(this.taskList);
}
