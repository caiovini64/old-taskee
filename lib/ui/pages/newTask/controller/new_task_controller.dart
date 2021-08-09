import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:taskee/domain/usecases/usecases.dart';

part 'new_task_state.dart';

class NewTaskController extends Cubit<NewTaskState> {
  final IAddTaskUsecase _addTaskUsecase;
  NewTaskController(this._addTaskUsecase) : super(NewTaskInitial());

  void addTask(String title, String subtitle, String state) async {
    emit(NewTaskLoading());
    await _addTaskUsecase.addTask(title, subtitle, state);
    emit(NewTaskDone());
    Get.back();
  }
}
