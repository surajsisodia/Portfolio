import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/colors.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
      color: darkColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              projectCard(
                  image: 'assets/images/glowcal.png',
                  title: "GlowCal",
                  des:
                      "Sample Sample Sample Sample Sample Sample Sample Sample Sample "),
              projectCard(
                  image: 'assets/images/glowcal.png',
                  title: "GlowCal",
                  des:
                      "Sample Sample Sample Sample Sample Sample Sample Sample Sample "),
            ],
          )
        ],
      ),
    );
  }

  Widget projectCard(
      {@required String? image,
      @required String? title,
      @required String? des}) {
    return Card(
      color: Colors.transparent,
      shadowColor: selectColor,
      elevation: 0,
      child: Container(
        width: 400,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.screen,
          gradient: LinearGradient(
              colors: [Colors.white, selectColor],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image!,
              height: 200,
              width: 200,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 20,
                      child: Text(
                        des!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
