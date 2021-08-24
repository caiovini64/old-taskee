import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:taskee/service_locator.dart' as dependencies;
import 'package:taskee/core/translations/app_translations.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/helpers/routes/routes.dart';
import 'package:taskee/ui/pages/controllers.dart';
import 'package:taskee/ui/pages/home/cubit/home_cubit.dart';
import 'package:taskee/ui/pages/login/login_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  dependencies.initControllers();
  dependencies.initUsecases();
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
          create: (context) => dependencies.serviceLocator.get<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => dependencies.serviceLocator.get<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => dependencies.serviceLocator.get<RegisterCubit>(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Taskee',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        getPages: AppPages.pages,
        locale: Get.deviceLocale,
        translationsKeys: AppTranslation.translations,
        home: LoginPage(),
      ),
    );
  }
}
