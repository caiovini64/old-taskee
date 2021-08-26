import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskee/ui/pages/edit_task/edit_task_page.dart';
import 'package:taskee/ui/pages/home/cubit/task_cubit.dart';

class CustomFloatingButtonEdit extends StatelessWidget {
  final TaskEntity task;
  const CustomFloatingButtonEdit({Key? key, required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TaskCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'btn1',
          backgroundColor: Colors.white,
          child: Icon(
            Icons.edit,
            color: greenCardColor,
            size: 25,
          ),
          onPressed: () => Get.toNamed(EditTaskPage.route, arguments: task),
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'btn2',
          backgroundColor: orangeCardColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            controller.deleteTask(task);
            Get.close(1);
          },
        ),
      ],
    );
  }
}
