import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:taskee/ui/components/components.dart';

import 'package:taskee/ui/helpers/theme/themes.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/newTask/cubit/new_task_cubit.dart';

class NewTaskPage extends StatelessWidget
    with ValidationsManager, KeyboardManager, UIErrorManager {
  static const route = '/newTask';
  NewTaskPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<NewTaskCubit>();
    final arguments = Get.arguments;
    return BlocConsumer<NewTaskCubit, NewTaskState>(
      listener: (context, state) {
        if (state is NewTaskError) showErrorMessage(context, state.error);
      },
      builder: (context, state) {
        return GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! > 8) {
              Get.back();
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 10, bottom: 20),
              child: Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Create new'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Task'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 35),
                        CustomField(
                          labelText: 'Title'.tr,
                          controller: titleController,
                          inputType: TextInputType.text,
                          obscureText: false,
                          semanticsLabel: 'Title text field',
                          validator: (value) => validateField(value),
                        ),
                        SizedBox(height: 35),
                        CustomField(
                          labelText: 'Content'.tr,
                          height: 150,
                          controller: subtitleController,
                          inputType: TextInputType.multiline,
                          obscureText: false,
                          semanticsLabel: 'Subtitle text field',
                          validator: (value) => validateField(value),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
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
                    final validate = _formKey.currentState!.validate();
                    if (validate) {
                      final title = titleController.value.text;
                      final subtitle = subtitleController.value.text;
                      controller.addTask(title, subtitle, arguments);
                      hideKeyboard(context);
                      Get.back();
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
