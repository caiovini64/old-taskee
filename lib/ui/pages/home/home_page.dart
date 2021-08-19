import 'package:flutter/material.dart';

import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/pages/home/components/child_page.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';

  final pageController = PageController(initialPage: 0);

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
