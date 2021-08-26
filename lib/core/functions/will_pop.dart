import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskee/data/models/models.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/service_locator.dart';

Future<bool> onWillPop() async {
  return (await Get.dialog(
    AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Do you want to exit an App'),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: true);
            serviceLocator.unregister<UserModel>();
            serviceLocator.unregister<List<TaskEntity>>();
          },
          child: Text('Yes'),
        ),
      ],
    ),
  ));
}
