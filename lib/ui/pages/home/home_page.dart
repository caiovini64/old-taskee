import 'package:flutter/material.dart';
import 'package:taskee/ui/pages/home/components/done/done_page.dart';
import 'package:taskee/ui/pages/home/components/inProgress/in_progress_page.dart';
import 'package:taskee/ui/pages/home/components/toDo/todo_page.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        TodoPage(),
        InProgressPage(),
        DonePage(),
      ],
    );
  }
}
