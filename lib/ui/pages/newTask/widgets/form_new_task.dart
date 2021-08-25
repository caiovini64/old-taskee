import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/mixins/mixins.dart';

class FormNewTask extends StatelessWidget with ValidationsManager {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController subtitleController;

  const FormNewTask({
    Key? key,
    required this.formKey,
    required this.titleController,
    required this.subtitleController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
    );
  }
}
