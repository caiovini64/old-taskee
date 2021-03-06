import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:taskee/domain/entities/entities.dart';

import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/home/cubit/task_cubit.dart';
import 'package:taskee/ui/pages/home/home_page.dart';

class FloatingButtonForm extends StatelessWidget with KeyboardManager {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final TaskStatus taskState;
  final String taskId;
  final bool isUpdate;
  final String titleButton;
  final Color titleColor;

  const FloatingButtonForm({
    Key? key,
    required this.formKey,
    required this.titleController,
    required this.subtitleController,
    required this.taskState,
    required this.titleButton,
    required this.titleColor,
    this.taskId = '',
    this.isUpdate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<TaskCubit>();
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Hero(
            tag: "add",
            child: CustomElevatedButton.principal(
              child: state is TaskLoading
                  ? CircularProgressIndicator(
                      color: primaryColor,
                    )
                  : Text(
                      titleButton,
                      style: TextStyle(color: titleColor),
                    ),
              onPressed: () {
                final validate = formKey.currentState!.validate();
                if (validate) {
                  final title = titleController.value.text;
                  final subtitle = subtitleController.value.text;
                  final TaskEntity taskUpdated = TaskEntity(
                    title: title,
                    content: subtitle,
                    state: taskState.description,
                    id: taskId,
                  );
                  isUpdate
                      ? controller.updateTask(taskUpdated)
                      : controller.addTask(
                          title, subtitle, taskState.description);
                  hideKeyboard(context);
                  Get.toNamed(HomePage.route, arguments: taskState);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
