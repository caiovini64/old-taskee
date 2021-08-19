import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:taskee/service_locator.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/newTask/cubit/new_task_cubit.dart';
import 'package:taskee/ui/pages/newTask/widgets/floating_button_form.dart';
import 'package:taskee/ui/pages/newTask/widgets/form_new_task.dart';

class NewTaskPage extends StatelessWidget
    with ValidationsManager, KeyboardManager, UIErrorManager {
  static const route = '/newTask';
  NewTaskPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<NewTaskCubit>(),
      child: BlocConsumer<NewTaskCubit, NewTaskState>(
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
                child: FormNewTask(
                  formKey: _formKey,
                  titleController: titleController,
                  subtitleController: subtitleController,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingButtonForm(
                formKey: _formKey,
                titleController: titleController,
                subtitleController: subtitleController,
              ),
            ),
          );
        },
      ),
    );
  }
}
