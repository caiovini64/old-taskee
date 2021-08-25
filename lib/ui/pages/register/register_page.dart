import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/presentation/mixins/mixins.dart';
import 'package:taskee/ui/pages/controllers.dart';
import 'package:taskee/ui/pages/register/widgets/register_form.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget
    with KeyboardManager, ValidationsManager, UIErrorManager {
  static const route = '/register';
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          showAuthErrorMessage(context, state.error);
        }
        if (state is RegisterSuccess) {
          Get.toNamed(SuccessDialog.route);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: RegisterForm(
            formKey: _formKey,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
          ),
        );
      },
    );
  }
}
