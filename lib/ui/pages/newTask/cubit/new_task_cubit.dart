import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

import 'package:taskee/domain/usecases/usecases.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  final IAddTaskUsecase _addTaskUsecase;
  NewTaskCubit(this._addTaskUsecase) : super(Initial());

  void addTask(String title, String subtitle, String state) async {
    emit(Loading());
    final result = await _addTaskUsecase.addTask(title, subtitle, state);
    result.fold(
      (failure) => emit(Error(failure.message)),
      (right) => emit(Success()),
    );
    Get.back();
  }
}
