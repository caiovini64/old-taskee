import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/mixins/auth_validator_mixin.dart';
import 'package:taskee/ui/widgets/widgets.dart';

import 'controller/login_controller.dart';

class LoginPage extends StatefulWidget with AuthValidator {
  static const route = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(controller.failureMessage),
            ),
          );
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(20),
                        color: Theme.of(context).backgroundColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 35),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Welcome!',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            SizedBox(height: 100),
                            CustomTextFieldWidget(
                              labelText: 'Login',
                              semanticsLabel: 'Email text field',
                              inputType: TextInputType.emailAddress,
                              controller: emailController,
                              obscureText: false,
                              validator: (value) => widget.validateEmail(value),
                            ),
                            SizedBox(height: 35),
                            CustomTextFieldWidget(
                              labelText: 'Password',
                              semanticsLabel: 'Password text field',
                              inputType: TextInputType.visiblePassword,
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
                              validator: (value) =>
                                  widget.validatePassword(value),
                            ),
                            SizedBox(height: 35),
                            ElevatedButton(
                              child: state is LoginLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text('Sign in'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(400, 60),
                                primary: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                final validate =
                                    _formKey.currentState!.validate();
                                if (validate) {
                                  final email = emailController.value.text;
                                  final password =
                                      passwordController.value.text;
                                  controller.login(email, password);
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                }
                              },
                            ),
                            SizedBox(height: 35),
                            ElevatedButton(
                              child: Text('Create new account'),
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(width: 2, color: primaryColor),
                                minimumSize: Size(400, 60),
                                primary: Colors.transparent,
                                elevation: 0,
                                onPrimary: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () => Get.toNamed('/register'),
                            ),
                            SizedBox(height: 35),
                            SignInButton(
                              Buttons.Google,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {},
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
