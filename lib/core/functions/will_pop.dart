import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskee/data/models/models.dart';
import 'package:taskee/domain/entities/entities.dart';
import 'package:taskee/service_locator.dart';

Future<bool> onWillPop() async {
  return (await Get.dialog(
    AlertDialog(
      title: Text('Are you sure?'.tr),
      content: Text('Do you want to exit the App?'.tr),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: Text('No'.tr),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: true);
            serviceLocator.unregister<UserModel>();
            serviceLocator.unregister<List<TaskEntity>>();
          },
          child: Text('Yes'.tr),
        ),
      ],
    ),
  ));
}
