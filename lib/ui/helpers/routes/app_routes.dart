import 'package:taskee/ui/components/success_dialog.dart';
import 'package:taskee/ui/pages/edit_task/edit_task_page.dart';
import 'package:taskee/ui/pages/home/home_page.dart';
import 'package:taskee/ui/pages/login/login_page.dart';
import 'package:taskee/ui/pages/newTask/new_task_page.dart';
import 'package:taskee/ui/pages/register/register_page.dart';
import 'package:taskee/ui/pages/task_details/task_details_page.dart';

abstract class Routes {
  static const LOGIN = LoginPage.route;
  static const REGISTER = RegisterPage.route;
  static const HOME = HomePage.route;
  static const NEWTASK = NewTaskPage.route;
  static const SUCCESS_DIALOG = SuccessDialog.route;
  static const TASK_DETAILS = TaskDetailsPage.route;
  static const EDIT_TASK = EditTaskPage.route;
}
