import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/service_locator.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  final IAddTaskUsecase _addTaskUsecase;
  NewTaskCubit(this._addTaskUsecase) : super(NewTaskInitial());

  final taskListSingleton = serviceLocator.get<List<TaskEntity>>();

  void addTask(String title, String subtitle, String state) async {
    emit(NewTaskLoading());
    final result = await _addTaskUsecase.addTask(title, subtitle, state);
    result.fold(
      (failure) => emit(NewTaskError(failure.message)),
      (right) {
        emit(NewTaskSuccess());
        _saveTask(title, subtitle, state);
      },
    );
  }

  void _saveTask(String title, String subtitle, String state) =>
      taskListSingleton.add(TaskEntity(
        title: title,
        subtitle: subtitle,
        state: state,
      ));
}
