import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskee/ui/components/components.dart';

import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/pages/newTask/new_task_page.dart';

class ToDoPage extends StatelessWidget {
  static const route = '/todo';
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
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(60)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 35),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'To do'.tr,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          SizedBox(height: 35),
                          TaskCard(
                            cardColor: orangeCardColor,
                            title: 'title',
                            subtitle: 'subtitle',
                            icon: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          TaskCard(
                            cardColor: orangeCardColor,
                            title: 'title',
                            subtitle:
                                "subtitle Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, b",
                            icon: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          TaskCard(
                            cardColor: orangeCardColor,
                            title: 'title',
                            subtitle: 'subtitle',
                            icon: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomFloatingButton(
            onTap: () => Get.toNamed(NewTaskPage.route, arguments: 'todo'),
          ),
        ],
      ),
    );
  }
}
