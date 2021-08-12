import 'package:flutter/material.dart';
import 'package:taskee/ui/helpers/theme/app_colors.dart';

class CustomFloatingButton extends StatelessWidget {
  final Function onTap;
  const CustomFloatingButton({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 39,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                  elevation: 0,
                  heroTag: "add",
                  backgroundColor: orangeCardColor,
                  child: Icon(Icons.add, color: Colors.white),
                  onPressed: () => onTap(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
