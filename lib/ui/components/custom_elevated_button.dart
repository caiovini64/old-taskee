import 'package:flutter/material.dart';
import 'package:taskee/ui/helpers/helpers.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;
  final double elevation;

  const CustomElevatedButton({
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    required this.child,
    required this.elevation,
  });

  const CustomElevatedButton.principal({
    this.backgroundColor = Colors.white,
    this.textColor = primaryColor,
    required this.onPressed,
    required this.child,
    this.elevation = 2,
  });

  const CustomElevatedButton.secondary({
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.white,
    required this.onPressed,
    required this.child,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: child,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(400, 60),
        primary: backgroundColor,
        onPrimary: textColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(width: 1.5, color: Colors.white),
      ),
      onPressed: () => onPressed(),
    );
  }
}
