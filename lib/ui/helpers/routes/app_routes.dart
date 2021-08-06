import 'package:taskee/ui/pages/login/login_page.dart';
import 'package:taskee/ui/pages/newTask/new_task_page.dart';
import 'package:taskee/ui/pages/register/register_page.dart';
import 'package:taskee/ui/pages/toDo/todo_page.dart';

abstract class Routes {
  static const LOGIN = LoginPage.route;
  static const REGISTER = RegisterPage.route;
  static const TODO = ToDoPage.route;
  static const NEWTASK = NewTaskPage.route;
}
