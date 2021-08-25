import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/service_locator.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/helpers/managers/task_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetTasksUsecase _getTasksUsecase;
  final IAddTaskUsecase _addTaskUsecase;
  final IUpdateTaskUsecase _updateTaskUsecase;
  final IDeleteTaskUsecase _deleteTaskUsecase;
  final ITaskManager _taskManager;
  HomeCubit(
    this._getTasksUsecase,
    this._addTaskUsecase,
    this._updateTaskUsecase,
    this._deleteTaskUsecase,
    this._taskManager,
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
        _taskManager.saveTaskList(data);
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
        final task = TaskEntity(
          id: right.name,
          title: title,
          subtitle: subtitle,
          state: state,
        );
        _taskManager.saveTask(task);
        emit(HomeDone(taskListSingleton));
      },
    );
  }

  void updateTaskState(TaskEntity task) async {
    final TaskState newState = _taskManager.updateTaskState(task);
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
        _taskManager.updateTask(right);
        emit(HomeDone(taskListSingleton));
      },
    );
  }

  void deleteTask(TaskEntity task) async {
    emit(HomeLoading());
    final result = await _deleteTaskUsecase.deleteTask(task);
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (right) {
        _taskManager.deleteTask(task);
        emit(HomeDone(taskListSingleton));
      },
    );
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    print(change);
  }
}
