import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/pages/home/components/child_page.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  final TaskState? taskState = Get.arguments;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: taskState?.index ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        ChildPage(title: 'To do', taskState: TaskState.todo),
        ChildPage(title: 'In progress', taskState: TaskState.progress),
        ChildPage(title: 'Done', taskState: TaskState.done),
      ],
    );
  }
}
