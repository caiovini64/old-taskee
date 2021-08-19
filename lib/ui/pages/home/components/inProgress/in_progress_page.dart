import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:taskee/service_locator.dart';
import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/newTask/new_task_page.dart';
import 'package:taskee/ui/pages/home/cubit/home_cubit.dart';
import 'package:taskee/ui/pages/home/components/task_list.dart';

class InProgressPage extends StatelessWidget with UIErrorManager {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<HomeCubit>(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 35),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'In progress'.tr,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            buildTaskList(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomFloatingButton(
              index: 2,
              onTap: () => Get.toNamed(NewTaskPage.route, arguments: 'todo'),
            ),
          ],
        ),
      ),
    );
  }

  buildTaskList(context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) showErrorMessage(context, state.failure);
      },
      builder: (context, state) {
        final controller = context.read<HomeCubit>();
        if (state is HomeDone)
          return TaskList(
            taskList: state.taskList,
            taskColor: primaryColor,
          );
        return TaskList(
          taskList: controller.taskListSingleton,
          taskColor: primaryColor,
        );
      },
    );
  }
}
