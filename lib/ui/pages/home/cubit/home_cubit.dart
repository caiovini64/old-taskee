import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/usecases/get_tasks_usecase.dart';
import 'package:taskee/service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetTasksUsecase _getTasksUsecase;
  HomeCubit(this._getTasksUsecase) : super(HomeInitial()) {
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

  _saveTasksInMemory(List<TaskEntity> taskList) {
    if (taskListSingleton.isEmpty) taskListSingleton.addAll(taskList);
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    print(change);
  }
}
