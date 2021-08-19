import 'package:get/get.dart';
import 'package:taskee/ui/components/success_dialog.dart';
import 'package:taskee/ui/helpers/routes/app_routes.dart';
import 'package:taskee/ui/pages/home/home_page.dart';
import 'package:taskee/ui/pages/login/login_page.dart';
import 'package:taskee/ui/pages/newTask/new_task_page.dart';
import 'package:taskee/ui/pages/register/register_page.dart';
import 'package:taskee/ui/pages/home/components/toDo/todo_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.NEWTASK,
      page: () => NewTaskPage(),
      transition: Transition.downToUp,
      fullscreenDialog: true,
    ),
    GetPage(
      name: Routes.SUCCESS_DIALOG,
      page: () => SuccessDialog(),
      fullscreenDialog: true,
    )
  ];
}
