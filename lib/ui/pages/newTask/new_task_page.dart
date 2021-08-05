import 'package:flutter/material.dart';
import 'package:taskee/ui/helpers/app_colors.dart';

class NewTaskPage extends StatelessWidget {
  static const route = '/newTask';
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
