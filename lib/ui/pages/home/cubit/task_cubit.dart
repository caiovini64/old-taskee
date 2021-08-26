import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/domain/usecases/usecases.dart';
import 'package:taskee/service_locator.dart';
import 'package:taskee/ui/helpers/managers/task_manager_impl.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/helpers/managers/task_manager.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final IGetTasksUsecase _getTasksUsecase;
  final IAddTaskUsecase _addTaskUsecase;
  final IUpdateTaskUsecase _updateTaskUsecase;
  final IDeleteTaskUsecase _deleteTaskUsecase;
  final ITaskManager _taskManager;
  TaskCubit(
    this._getTasksUsecase,
    this._addTaskUsecase,
    this._updateTaskUsecase,
    this._deleteTaskUsecase,
    this._taskManager,
  ) : super(TaskInitial()) {
    getTasks();
  }

  final taskListSingleton = serviceLocator.get<List<TaskEntity>>();

  void getTasks() async {
    emit(TaskLoading());
    final result = await _getTasksUsecase.getTasks();
    result.fold(
      (failure) => emit(TaskError(failure.message)),
      (data) {
        _taskManager.saveTaskList(data);
        emit(TaskDone(taskListSingleton));
      },
    );
  }

  void addTask(String title, String subtitle, String state) async {
    emit(TaskLoading());
    final result = await _addTaskUsecase.addTask(title, subtitle, state);
    result.fold(
      (failure) => emit(TaskError(failure.message)),
      (right) {
        final task = TaskEntity(
          id: right.name,
          title: title,
          content: subtitle,
          state: state,
        );
        _taskManager.saveTask(task);
        emit(TaskDone(taskListSingleton));
      },
    );
  }

  void updateTaskState(TaskEntity task, StateTaskUpdate stateTaskUpdate) async {
    final TaskStatus newState =
        _taskManager.updateTaskState(task, stateTaskUpdate);
    final taskUpdated = TaskEntity(
      id: task.id,
      title: task.title,
      content: task.content,
      state: newState.description,
    );
    emit(TaskLoading());
    final result = await _updateTaskUsecase.update(taskUpdated);
    result.fold(
      (failure) => emit(TaskError(failure.message)),
      (right) {
        _taskManager.updateTask(right);
        emit(TaskDone(taskListSingleton));
      },
    );
  }

  void updateTask(TaskEntity task) async {
    emit(TaskLoading());
    final taskUpdated = TaskEntity(
      id: task.id,
      title: task.title,
      content: task.content,
      state: task.state,
    );
    final result = await _updateTaskUsecase.update(taskUpdated);
    result.fold(
      (failure) => emit(TaskError(failure.message)),
      (right) {
        _taskManager.updateTask(right);
        emit(TaskDone(taskListSingleton));
      },
    );
  }

  void deleteTask(TaskEntity task) async {
    emit(TaskLoading());
    final result = await _deleteTaskUsecase.deleteTask(task);
    result.fold(
      (failure) => emit(TaskError(failure.message)),
      (right) {
        _taskManager.deleteTask(task);
        emit(TaskDone(taskListSingleton));
      },
    );
  }

  @override
  void onChange(Change<TaskState> change) {
    super.onChange(change);
    print(change);
  }
}
