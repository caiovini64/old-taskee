import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskee/service_locator.dart';

import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/controllers.dart';
import 'package:taskee/ui/pages/login/cubit/login_cubit.dart';
import 'package:taskee/ui/pages/login/widgets/form_login.dart';

class LoginPage extends StatelessWidget
    with KeyboardManager, ValidationsManager, UIErrorManager {
  static const route = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<LoginCubit>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FormLogin(),
      ),
    );
  }
}
