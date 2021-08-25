import 'package:flutter/material.dart';

class EditTaskPage extends StatelessWidget {
  static const route = '/editTask';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
