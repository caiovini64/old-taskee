import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/helpers/routes/app_pages.dart';
import 'package:taskee/ui/pages/login/controller/login_controller.dart';
import 'package:taskee/ui/pages/login/login_page.dart';
import 'package:taskee/service_locator.dart' as dependencies;
import 'package:taskee/ui/pages/newTask/controller/new_task_controller.dart';
import 'package:taskee/ui/pages/register/controller/register_controller.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  dependencies.initControllers();
  dependencies.initUsecases();
  dependencies.initRepositories();
  dependencies.initDatasources();
  dependencies.initServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                dependencies.serviceLocator.get<LoginController>()),
        BlocProvider(
            create: (context) =>
                dependencies.serviceLocator.get<RegisterController>()),
        BlocProvider(
            create: (context) =>
                dependencies.serviceLocator.get<NewTaskController>()),
      ],
      child: GetMaterialApp(
        title: 'Taskee',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.darkTheme,
        getPages: AppPages.pages,
        home: LoginPage(),
      ),
    );
  }
}
