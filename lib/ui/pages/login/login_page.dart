import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/controllers.dart';
import 'package:taskee/ui/pages/login/cubit/login_cubit.dart';
import 'package:taskee/ui/pages/register/register_page.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with KeyboardManager, ValidationsManager, UIErrorManager {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginController>();
    return BlocConsumer<LoginController, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          showAuthErrorMessage(context, controller.failureMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(20),
                      color: primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Welcome!'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 100),
                          CustomField(
                            labelText: 'Email',
                            semanticsLabel: 'Email text field'.tr,
                            inputType: TextInputType.emailAddress,
                            controller: emailController,
                            maxLines: 1,
                            obscureText: false,
                            validator: (value) => validateEmail(value),
                          ),
                          SizedBox(height: 35),
                          CustomField(
                            labelText: 'Password'.tr,
                            semanticsLabel: 'Password text field'.tr,
                            inputType: TextInputType.visiblePassword,
                            maxLines: 1,
                            controller: passwordController,
                            obscureText: obscureText,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                obscureText = !obscureText;
                                setState(() {});
                              },
                              child: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            validator: (value) => validatePassword(value),
                          ),
                          SizedBox(height: 35),
                          CustomElevatedButton.principal(
                            child: state is LoginLoading
                                ? CircularProgressIndicator(
                                    color: primaryColor,
                                  )
                                : Text('Sign in'.tr),
                            onPressed: () {
                              final validate =
                                  _formKey.currentState!.validate();
                              if (validate) {
                                final email = emailController.value.text;
                                final password = passwordController.value.text;
                                controller.login(email, password);
                                hideKeyboard(context);
                              }
                            },
                          ),
                          SizedBox(height: 35),
                          CustomElevatedButton.secondary(
                            child: Text('Create new account'.tr),
                            onPressed: () => Get.toNamed(RegisterPage.route),
                          ),
                          SizedBox(height: 35),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
