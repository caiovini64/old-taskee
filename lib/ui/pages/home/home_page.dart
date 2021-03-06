import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskee/core/functions/will_pop.dart';

import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/pages/home/components/child_page.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  final TaskStatus? taskState = Get.arguments;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: taskState?.index ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: PageView(
        controller: pageController,
        children: [
          ChildPage(title: 'To do', taskState: TaskStatus.todo),
          ChildPage(title: 'In progress', taskState: TaskStatus.progress),
          ChildPage(title: 'Done', taskState: TaskStatus.done),
        ],
      ),
    );
  }
}
