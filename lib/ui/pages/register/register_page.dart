import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/mixins/validator_mixin.dart';
import 'package:taskee/ui/pages/register/controller/register_controller.dart';
import 'package:taskee/ui/widgets/widgets.dart';

class RegisterPage extends StatefulWidget with Validators {
  static const route = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ),
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
                                'Create your account',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            SizedBox(height: 100),
                            CustomTextFieldWidget(
                              labelText: 'Email',
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
                            CustomTextFieldWidget(
                              labelText: 'Confirm your password',
                              semanticsLabel:
                                  'Confirm your password text field',
                              inputType: TextInputType.visiblePassword,
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
                              validator: (value) => widget.confirmPassword(
                                  value, passwordController.value.text),
                            ),
                            SizedBox(height: 35),
                            ElevatedButton(
                              child: state is RegisterLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text('Sign up'),
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
