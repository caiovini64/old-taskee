import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/widgets/widgets.dart';

import 'controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginController>();
    return BlocBuilder<LoginController, LoginState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(
              children: [
                SizedBox(height: 100),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.all(20),
                      color: backgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 35),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Wellcome!',
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
                          ),
                          SizedBox(height: 35),
                          CustomTextFieldWidget(
                            labelText: 'Password',
                            semanticsLabel: 'Password text field',
                            inputType: TextInputType.visiblePassword,
                            controller: passwordController,
                            obscureText: true,
                          ),
                          SizedBox(height: 35),
                          ElevatedButton(
                            child: state is LoginLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text('Login'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(400, 60),
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              final email = emailController.value.text;
                              final password = passwordController.value.text;
                              controller.login(email, password);
                            },
                          ),
                          SizedBox(height: 35),
                          ElevatedButton(
                            child: Text('Create new account'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(400, 60),
                              primary: primaryColorDark,
                              onPrimary: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {},
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
        );
      },
    );
  }
}
