import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/controllers.dart';
import 'package:taskee/ui/pages/home/home_page.dart';

class FloatingButtonForm extends StatelessWidget with KeyboardManager {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final TaskState taskState;

  const FloatingButtonForm({
    Key? key,
    required this.formKey,
    required this.titleController,
    required this.subtitleController,
    required this.taskState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<NewTaskCubit>();
    return BlocBuilder<NewTaskCubit, NewTaskState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Hero(
            tag: "add",
            child: CustomElevatedButton.principal(
              child: state is NewTaskLoading
                  ? CircularProgressIndicator(
                      color: primaryColor,
                    )
                  : Text(
                      'Add new Task'.tr,
                      style: TextStyle(color: primaryColor),
                    ),
              onPressed: () {
                final validate = formKey.currentState!.validate();
                if (validate) {
                  final title = titleController.value.text;
                  final subtitle = subtitleController.value.text;
                  controller.addTask(title, subtitle, taskState.description);
                  hideKeyboard(context);
                  Get.toNamed(HomePage.route);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
