import 'package:get/get.dart';
import 'package:taskee/ui/helpers/routes/app_routes.dart';
import 'package:taskee/ui/pages/login/login_page.dart';
import 'package:taskee/ui/pages/register/register_page.dart';

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
  ];
}
