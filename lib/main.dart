import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/pages/login/controller/login_controller.dart';
import 'package:taskee/ui/pages/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginController()),
        ],
        child: LoginPage(),
      ),
    );
  }
}
