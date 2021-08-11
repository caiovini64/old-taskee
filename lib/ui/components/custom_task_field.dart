import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final String semanticsLabel;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final double height;
  final int maxLines;

  const CustomField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.inputType,
    required this.obscureText,
    required this.semanticsLabel,
    required this.validator,
    this.height = 60,
    this.suffixIcon,
    this.maxLines = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          keyboardType: inputType,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          maxLines: maxLines,
          style: Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: labelText,
            hintStyle: Theme.of(context).textTheme.bodyText1,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
