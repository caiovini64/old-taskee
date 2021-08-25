import 'package:flutter/material.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/pages/edit_task/widgets/custom_floating_button_edit.dart';

class EditTaskPage extends StatelessWidget {
  static const route = '/editTask';

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
        child: Column(),
      ),
      floatingActionButton: CustomFloatingButtonEdit(),
    );
  }
}
