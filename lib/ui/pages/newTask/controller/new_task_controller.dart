import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:taskee/domain/repositories/repositories.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/infra/repositories/add_task_repository_impl.dart';

part 'new_task_state.dart';

class NewTaskController extends Cubit<NewTaskState> {
  final IAddTaskRepository _addTaskRepository;
  NewTaskController(this._addTaskRepository) : super(NewTaskInitial());

  void addTask(String title, String subtitle, String state) async {
    emit(NewTaskLoading());
    await _addTaskRepository.addTask(title, subtitle, state);
    emit(NewTaskDone());
    Get.back();
  }
}
