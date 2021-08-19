import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/usecases/get_tasks_usecase.dart';
import 'package:taskee/service_locator.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final IGetTasksUsecase _getTasksUsecase;
  TodoCubit(this._getTasksUsecase) : super(TodoInitial()) {
    getTasks();
  }

  final taskListSingleton = serviceLocator.get<List<TaskEntity>>();

  void getTasks() async {
    emit(TodoLoading());
    final result = await _getTasksUsecase.getTasks();
    result.fold(
      (failure) => emit(TodoError(failure.message)),
      (data) {
        _saveTasksInMemory(data);
        emit(TodoDone(taskListSingleton));
      },
    );
  }

  _saveTasksInMemory(List<TaskEntity> taskList) {
    if (taskListSingleton.isEmpty) taskListSingleton.addAll(taskList);
  }

  @override
  void onChange(Change<TodoState> change) {
    super.onChange(change);
    print(change);
  }
}
