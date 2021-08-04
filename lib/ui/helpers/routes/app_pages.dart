import 'package:get/get.dart';
import 'package:taskee/ui/helpers/routes/app_routes.dart';
import 'package:taskee/ui/pages/login/login_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
  ];
}
