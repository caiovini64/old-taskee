import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/datasources/datasources.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/service_locator.dart';

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

  void updateTaskState(TaskEntity task) async {}

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

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    print(change);
  }
}
