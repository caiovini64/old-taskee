import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:taskee/ui/components/components.dart';
import 'package:taskee/ui/helpers/helpers.dart';
import 'package:taskee/ui/presentation/mixins/mixins.dart';
import 'package:taskee/ui/pages/controllers.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController confirmPasswordController;

  const RegisterForm({
    Key? key,
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.emailController,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm>
    with ValidationsManager, KeyboardManager {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: widget.formKey,
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
                          controller: widget.emailController,
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
                          controller: widget.passwordController,
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
                          semanticsLabel: 'Confirm your password text field'.tr,
                          inputType: TextInputType.visiblePassword,
                          maxLines: 1,
                          controller: widget.confirmPasswordController,
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
                              value, widget.passwordController.value.text),
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
                                widget.formKey.currentState!.validate();
                            if (validate) {
                              final email = widget.emailController.value.text;
                              final password =
                                  widget.passwordController.value.text;
                              controller.register(email, password);

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
        );
      },
    );
  }
}
