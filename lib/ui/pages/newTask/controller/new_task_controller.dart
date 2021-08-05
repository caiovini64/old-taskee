import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/usecases/usecases.dart';

part 'new_task_state.dart';

class NewTaskController extends Cubit<NewTaskState> {
  final AddTaskUsecase addTaskUsecase;
  NewTaskController(this.addTaskUsecase) : super(NewTaskInitial());

  void addTask(String title, String subtitle, String state) async {
    emit(NewTaskLoading());
    final result = await addTaskUsecase(title, subtitle, state);
    result.fold(
      (failure) => emit(NewTaskError()),
      (data) => emit(NewTaskDone()),
    );
  }
}
