import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/pages/task_details/widgets/custom_floating_button_edit.dart';

class TaskDetailsPage extends StatelessWidget {
  static const route = '/taskDetails';
  final TaskEntity task = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenCardColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  task.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            Text(task.content),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingButtonEdit(task: task),
    );
  }
}
