import 'package:flutter/material.dart';
import 'package:taskee/ui/helpers/helpers.dart';

class CustomFloatingButtonEdit extends StatelessWidget {
  const CustomFloatingButtonEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'btn1',
          backgroundColor: Colors.white,
          child: Icon(
            Icons.edit,
            color: greenCardColor,
            size: 25,
          ),
          onPressed: () {},
        ),
        SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'btn2',
          backgroundColor: orangeCardColor,
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
