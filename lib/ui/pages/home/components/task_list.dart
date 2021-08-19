import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskee/domain/entities/entities.dart';

import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/home/cubit/home_cubit.dart';

class TaskList extends StatelessWidget with UIErrorManager {
  final List<TaskEntity> taskList;
  final Color taskColor;
  const TaskList({required this.taskList, required this.taskColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Visibility(
        visible: taskList.isNotEmpty,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, index) {
            final task = taskList[index];
            return TaskCard(
              cardColor: taskColor,
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
