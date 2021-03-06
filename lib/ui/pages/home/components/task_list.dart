import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/helpers/managers/task_manager_impl.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/home/cubit/task_cubit.dart';
import 'package:taskee/ui/pages/task_details/task_details_page.dart';

class TaskList extends StatelessWidget with UIErrorManager {
  final List<TaskEntity> taskList;
  const TaskList({required this.taskList});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TaskCubit>();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 90.0),
        child: Visibility(
          visible: taskList.isNotEmpty,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: taskList.length,
            itemBuilder: (BuildContext context, index) {
              final task = taskList[index];
              return GestureDetector(
                onTap: () =>
                    Get.toNamed(TaskDetailsPage.route, arguments: task),
                child: TaskCard(
                  cardColor: greenCardColor,
                  title: task.title,
                  subtitle: task.content,
                  iconBack: Visibility(
                    visible: task.state != TaskStatus.todo.description,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.updateTaskState(task, StateTaskUpdate.back);
                      },
                    ),
                  ),
                  icon: IconButton(
                    icon: Icon(
                      task.state == TaskStatus.done.description
                          ? Icons.delete
                          : Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (task.state == TaskStatus.done.description) {
                        controller.deleteTask(task);
                      } else {
                        controller.updateTaskState(
                            task, StateTaskUpdate.forward);
                      }
                    },
                  ),
                ),
              );
            },
          ),
          replacement: Container(),
        ),
      ),
    );
  }
}
