import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/components/error_message.dart';
import 'package:taskee/ui/components/success_dialog.dart';

import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/mixins/mixins.dart';
import 'package:taskee/ui/pages/controllers.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with KeyboardManager, ValidationsManager {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final controller = context.read<RegisterController>();
    return BlocConsumer<RegisterController, RegisterState>(
      listener: (context, state) {
        if (state is RegisterError) {
          showErrorMessage(context, controller.failureMessage);
        }
        if (state is RegisterDone) {
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
          body: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(20),
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Create your account'.tr,
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
                            CustomField(
                              labelText: 'Confirm your password'.tr,
                              semanticsLabel:
                                  'Confirm your password text field'.tr,
                              inputType: TextInputType.visiblePassword,
                              maxLines: 1,
                              controller: confirmPasswordController,
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
                              validator: (value) => confirmPassword(
                                  value, passwordController.value.text),
                            ),
                            SizedBox(height: 35),
                            CustomElevatedButton.principal(
                              child: state is RegisterLoading
                                  ? CircularProgressIndicator(
                                      color: primaryColor,
                                    )
                                  : Text('Sign up'.tr),
                              onPressed: () {
                                final validate =
                                    _formKey.currentState!.validate();
                                if (validate) {
                                  final email = emailController.value.text;
                                  final password =
                                      passwordController.value.text;
                                  controller.login(email, password);
                                  hideKeyboard(context);
                                }
                              },
                            ),
                          ],
                        ),
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
