import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void errorMessageWidget(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(error),
    ),
  );
}
