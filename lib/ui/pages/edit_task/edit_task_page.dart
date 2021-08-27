import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/helpers/helpers.dart';

import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/home/cubit/task_cubit.dart';
import 'package:taskee/ui/pages/newTask/widgets/floating_button_form.dart';
import 'package:taskee/ui/pages/newTask/widgets/form_task.dart';

class EditTaskPage extends StatelessWidget
    with ValidationsManager, KeyboardManager, UIErrorManager, TasksManager {
  static const route = '/editTask';
  EditTaskPage({Key? key}) : super(key: key);

  final TaskEntity task = Get.arguments;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: task.title);
    final subtitleController = TextEditingController(text: task.content);
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is TaskError) showErrorMessage(context, state.failure);
      },
      builder: (context, state) {
        return GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! > 8) {
              Get.back();
            }
          },
          child: Scaffold(
            backgroundColor: greenCardColor,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 20),
              child: FormTask(
                title: 'Edit Task',
                formKey: _formKey,
                titleController: titleController,
                subtitleController: subtitleController,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingButtonForm(
              isUpdate: true,
              formKey: _formKey,
              titleController: titleController,
              subtitleController: subtitleController,
              taskState: toState(task.state),
              titleButton: 'Edit your Task'.tr,
              titleColor: greenCardColor,
              taskId: task.id,
            ),
          ),
        );
      },
    );
  }
}
