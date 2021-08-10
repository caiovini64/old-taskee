import 'package:get/get.dart';
import 'package:taskee/services/properties.dart';

Future<void> initServices() async {
  await Get.putAsync(() => Properties().init());
}
