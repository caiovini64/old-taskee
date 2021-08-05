import 'package:flutter/material.dart';
import 'package:taskee/ui/helpers/app_colors.dart';
import 'package:taskee/ui/widgets/widgets.dart';

class ToDoPage extends StatelessWidget {
  static const route = '/todo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 100),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 35),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'To do',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      SizedBox(height: 35),
                      TaskCardWidget(
                        cardColor: orangeCardColor,
                        title: 'title',
                        subtitle: 'subtitle',
                        icon: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
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
  }
}
