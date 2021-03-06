import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/states/task_state.dart';
import 'package:taskee/ui/pages/newTask/new_task_page.dart';
import 'package:taskee/ui/pages/home/cubit/task_cubit.dart';
import 'package:taskee/ui/pages/home/components/task_list.dart';
import 'package:taskee/ui/mixins/mixins.dart';

class ChildPage extends StatelessWidget with UIErrorManager, TasksManager {
  final String title;
  final TaskStatus taskState;

  const ChildPage({Key? key, required this.title, required this.taskState})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 100),
                Expanded(
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: taskState.index == 0
                            ? BorderRadius.only(topLeft: Radius.circular(60))
                            : taskState.index == 1
                                ? BorderRadius.only(topLeft: Radius.circular(0))
                                : BorderRadius.only(
                                    topRight: Radius.circular(60)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 35),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              title.tr,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          SizedBox(height: 2),
                          Divider(
                            color: Colors.black.withOpacity(0.3),
                            height: 2,
                            thickness: 1,
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
            index: taskState.index,
            onTap: () => Get.toNamed(NewTaskPage.route, arguments: taskState),
          ),
        ],
      ),
    );
  }

  buildTaskList(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        final controller = context.read<TaskCubit>();
        if (state is TaskDone)
          return TaskList(
            taskList: filterTasks(
              taskList: controller.taskListSingleton,
              taskState: taskState,
            ),
          );
        return TaskList(
          taskList: filterTasks(
              taskList: controller.taskListSingleton, taskState: taskState),
        );
      },
    );
  }
}
