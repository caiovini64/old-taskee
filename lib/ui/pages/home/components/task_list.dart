import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskee/domain/entities/entities.dart';

import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/home/cubit/home_cubit.dart';

class TaskList extends StatelessWidget with UIErrorManager {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) showErrorMessage(context, state.failure);
      },
      builder: (context, state) {
        if (state is HomeDone) return buildList(state.taskList, controller);
        return buildList(controller.taskListSingleton, controller);
      },
    );
  }

  buildList(List<TaskEntity> taskList, HomeCubit controller) {
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
