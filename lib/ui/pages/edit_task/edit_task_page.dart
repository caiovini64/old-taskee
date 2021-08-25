import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/helpers/helpers.dart';

import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/home/cubit/home_cubit.dart';
import 'package:taskee/ui/pages/newTask/widgets/floating_button_form.dart';
import 'package:taskee/ui/pages/newTask/widgets/form_new_task.dart';

class EditTaskPage extends StatelessWidget
    with ValidationsManager, KeyboardManager, UIErrorManager, TasksManager {
  static const route = '/editTask';
  EditTaskPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TaskEntity task = Get.arguments;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) showErrorMessage(context, state.failure);
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
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingButtonForm(
              formKey: _formKey,
              titleController: titleController,
              subtitleController: subtitleController,
              taskState: toState(task.state),
            ),
          ),
        );
      },
    );
  }
}
