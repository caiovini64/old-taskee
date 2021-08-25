import 'package:flutter/material.dart';

import 'package:taskee/ui/presentation/mixins/mixins.dart';
import 'package:taskee/ui/pages/login/widgets/form_login.dart';

class LoginPage extends StatelessWidget
    with KeyboardManager, ValidationsManager, UIErrorManager {
  static const route = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FormLogin(),
    );
  }
}
