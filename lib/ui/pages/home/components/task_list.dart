import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskee/domain/entities/entities.dart';

import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/home/cubit/todo_cubit.dart';

class TaskList extends StatelessWidget with UIErrorManager {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<TodoCubit>();
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        if (state is TodoError) showErrorMessage(context, state.failure);
      },
      builder: (context, state) {
        if (state is TodoDone) return buildList(state.taskList, controller);
        return buildList(controller.taskListSingleton, controller);
      },
    );
  }

  buildList(List<TaskEntity> taskList, TodoCubit controller) {
    return Expanded(
      child: Visibility(
        visible: controller.taskListSingleton.isNotEmpty,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, index) {
            final task = taskList[index];
            return TaskCard(
              cardColor: orangeCardColor,
              title: task.title,
              subtitle: task.subtitle,
              icon: IconButton(
                icon: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            );
          },
        ),
        replacement: Container(),
      ),
    );
  }
}
