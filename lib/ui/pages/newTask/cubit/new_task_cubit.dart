import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import 'package:taskee/domain/usecases/usecases.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  final IAddTaskUsecase _addTaskUsecase;
  NewTaskCubit(this._addTaskUsecase) : super(NewTaskInitial());

  void addTask(String title, String subtitle, String state) async {
    emit(NewTaskLoading());
    final result = await _addTaskUsecase.addTask(title, subtitle, state);
    result.fold(
      (failure) => emit(NewTaskError(failure.message)),
      (right) => emit(NewTaskSuccess()),
    );
    Get.back();
  }
}
