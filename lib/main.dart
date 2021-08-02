import 'package:flutter/material.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: LoginPage(),
    );
  }
}
