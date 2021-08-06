import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:taskee/ui/helpers/app_colors.dart';
import 'package:taskee/ui/mixins/validator_mixin.dart';
import 'package:taskee/ui/pages/newTask/components/custom_task_field.dart';
import 'package:taskee/ui/pages/newTask/controller/new_task_controller.dart';

class NewTaskPage extends StatelessWidget with Validators {
  static const route = '/newTask';
  NewTaskPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<NewTaskController>();
    final arguments = Get.arguments;
    return BlocBuilder<NewTaskController, NewTaskState>(
      builder: (context, state) {
        return Scaffold(
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
                          'Create new',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Task',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      SizedBox(height: 35),
                      CustomTaskFieldWidget(
                        labelText: 'Title',
                        controller: titleController,
                        inputType: TextInputType.text,
                        obscureText: false,
                        semanticsLabel: 'Title text field',
                        validator: (value) => validateField(value),
                      ),
                      SizedBox(height: 35),
                      CustomTaskFieldWidget(
                        labelText: 'Content',
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
              child: ElevatedButton(
                child: state is NewTaskLoading
                    ? CircularProgressIndicator(
                        color: primaryColor,
                      )
                    : Text(
                        'Add new Task',
                        style: TextStyle(color: primaryColor),
                      ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(400, 60),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  final validate = _formKey.currentState!.validate();
                  if (validate) {
                    final title = titleController.value.text;
                    final subtitle = subtitleController.value.text;
                    controller.addTask(title, subtitle, arguments);
                    FocusScope.of(context).requestFocus(new FocusNode());
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
