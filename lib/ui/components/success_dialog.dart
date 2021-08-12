import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskee/ui/pages/login/login_page.dart';

class SuccessDialog extends StatelessWidget {
  static const route = "/successDialog";

  final Future duration = Future.delayed(Duration(milliseconds: 1600));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: duration,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Lottie.asset("assets/lotties/confirm.json", height: 200);
            return LoginPage();
          },
        ),
      ),
    );
  }
}
