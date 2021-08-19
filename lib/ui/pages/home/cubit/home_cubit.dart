import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetTasksUsecase _getTasksUsecase;
  final IAddTaskUsecase _addTaskUsecase;
  HomeCubit(this._getTasksUsecase, this._addTaskUsecase)
      : super(HomeInitial()) {
    getTasks();
  }

  final taskListSingleton = serviceLocator.get<List<TaskEntity>>();

  void getTasks() async {
    emit(HomeLoading());
    final result = await _getTasksUsecase.getTasks();
    result.fold(
      (failure) => emit(HomeError(failure.message)),
      (data) {
        _saveTasksInMemory(data);
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
        _saveTask(title, subtitle, state);
        emit(HomeDone(taskListSingleton));
      },
    );
  }

  _saveTasksInMemory(List<TaskEntity> taskList) {
    if (taskListSingleton.isEmpty) taskListSingleton.addAll(taskList);
  }

  void _saveTask(String title, String subtitle, String state) =>
      taskListSingleton.add(TaskEntity(
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
