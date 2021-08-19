part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String failure;
  HomeError(this.failure);
}

class HomeDone extends HomeState {
  final List<TaskEntity> taskList;
  HomeDone(this.taskList);
}
