import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/service_locator.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetTasksUsecase _getTasksUsecase;
  final IAddTaskUsecase _addTaskUsecase;
  final IUpdateTaskUsecase _updateTaskUsecase;
  HomeCubit(
    this._getTasksUsecase,
    this._addTaskUsecase,
    this._updateTaskUsecase,
  ) : super(HomeInitial()) {
    getTasks();
  }

  final taskListSingleton = serviceLocator.get<List<TaskEntity>>();

  void getTasks() async {
    emit(HomeLoading());
    final result = await _getTasksUsecase.getTasks();
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (data) {
        _saveTaskList(data);
        emit(HomeDone(taskListSingleton));
      },
    );
  }

  void addTask(String title, String subtitle, String state) async {
    emit(HomeLoading());
    final result = await _addTaskUsecase.addTask(title, subtitle, state);
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (right) {
        _saveTask(right.name, title, subtitle, state);
        emit(HomeDone(taskListSingleton));
      },
    );
  }

  void updateTaskState(TaskEntity task) async {
    final newState = _checkTaskState(task);
    final taskUpdated = TaskEntity(
      id: task.id,
      title: task.title,
      subtitle: task.subtitle,
      state: newState.description,
    );
    emit(HomeLoading());
    final result = await _updateTaskUsecase.update(taskUpdated);
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (right) {
        _updateTask(right);
        emit(HomeDone(taskListSingleton));
      },
    );
  }

  _saveTaskList(List<TaskEntity> taskList) {
    if (taskListSingleton.isEmpty) taskListSingleton.addAll(taskList);
  }

  void _saveTask(String id, String title, String subtitle, String state) =>
      taskListSingleton.add(TaskEntity(
        id: id,
        title: title,
        subtitle: subtitle,
        state: state,
      ));
  void _updateTask(TaskEntity task) {
    final taskIndex =
        taskListSingleton.indexWhere((element) => element.id == task.id);
    taskListSingleton[taskIndex] = task;
  }

  TaskState _checkTaskState(TaskEntity task) {
    if (task.state == TaskState.todo.description) return TaskState.progress;
    if (task.state == TaskState.progress.description) return TaskState.done;
    return TaskState.progress;
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    print(change);
  }
}
