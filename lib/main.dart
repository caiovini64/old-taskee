import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/pages/login/controller/login_controller.dart';
import 'package:taskee/ui/pages/login/login_page.dart';
import 'package:taskee/injection_container.dart' as dependencies;

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  dependencies.serviceLocator.get<LoginController>()),
        ],
        child: LoginPage(),
      ),
    );
  }
}
